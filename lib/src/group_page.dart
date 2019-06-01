import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return GestureDetector(
            child: ListTile(
              title: Text('Group $index'),
              subtitle: Text('Short Description'),
              trailing: Icon(Icons.chevron_right),
            ),
            onTap: () {
              print('teste $index');
            },
          );
        },
      ),
    );
  }
}
