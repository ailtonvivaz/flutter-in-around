import 'package:flutter/material.dart';
import 'package:flutter_in_around/src/group_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _tabbarPages = <Widget>[
    Text('Feed'),
    GroupPage(),
    Text('Events'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          )
        ],
      ),
      body: _tabbarPages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.view_agenda), title: Text('Feed')),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat), title: Text('Groups')),
          BottomNavigationBarItem(
              icon: Icon(Icons.event), title: Text('Events')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
