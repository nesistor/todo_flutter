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
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      SearchPage(),
      TasksPage(),
      ProfilePage(),
    ];

    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          height: 55.0,
          items: <Widget>[
            Icon(Icons.search, size: 30, color: Colors.white),
            Icon(Icons.add, size: 50, color: Colors.white),
            Icon(Icons.person, size: 30, color: Colors.white),
          ],
          color: Colors.black,
          buttonBackgroundColor: Colors.black,
          backgroundColor: Colors.blue, // You can set your desired background color
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
      body: pages[_page],
    );

  }
}
