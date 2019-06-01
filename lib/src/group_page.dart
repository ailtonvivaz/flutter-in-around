import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_in_around/src/model/Group.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('databases/development/groups')
            .snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return new ListView.separated(
                separatorBuilder: (_, __) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  );
                },
                itemCount: snapshot.data.documents.length + 1,
                itemBuilder: (_, index) {

                  if (index == 0) {
                    return Center(child: FlatButton.icon(
                      icon: Icon(Icons.add),
                      label: Text('ADD NEW GROUP'),
                      onPressed: (){},
                    ));
                  }

                  var document = snapshot.data.documents[index - 1];
                  var group = Group.fromMap(document.documentID, document.data);
                  return GestureDetector(
                    child: ListTile(
                      title: Text(group.name),
                      subtitle: Text(group.shortDescription),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    onTap: () {
                      print('teste');
                    },
                  );
                },
              );
          }
        },
      ),
    );
  }
}
