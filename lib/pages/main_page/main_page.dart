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
  bool _isAddWidgetOpen = false;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

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
        backgroundColor: Color.fromRGBO(25, 25, 25, 0.8),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          if (index == 1) {
            // Handle "Add" icon tap
            setState(() {
              _isAddWidgetOpen = true;
            });
          } else {
            setState(() {
              _page = index;
            });
          }
        },
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: pages[_page],
          ),
          if (_isAddWidgetOpen)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  // Close "Add" widget when tapping outside of it
                  setState(() {
                    _isAddWidgetOpen = false;
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5), // You can set your desired color and opacity
                ),
              ),
            ),
          if (_isAddWidgetOpen)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter your text...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
