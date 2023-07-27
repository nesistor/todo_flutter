import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:todo_flutter/pages/search_page/search_page.dart';
import 'package:todo_flutter/pages/profile_page/profile_page.dart';
import 'package:todo_flutter/pages/tasks_page/tasks_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _page = 0;

  final List<Widget> _pages = [
    SearchPage(),
    TasksPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 55.0,
        items: <Widget>[
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.add, size: 50, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Color.fromRGBO(25, 25, 25, 0.8),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          if (index == 1) {
            // Navigate to the TasksPage by changing the page index
            setState(() {
              _page = 1;
            });
          } else {
            setState(() {
              _page = index;
            });
          }
        },
      ),
      body: IndexedStack(
        index: _page,
        children: _pages,
      ),
    );
  }
}

