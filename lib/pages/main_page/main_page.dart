import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// Import your other page files
import 'package:todo_flutter/pages/article_page/article_page.dart';
import 'package:todo_flutter/pages/search_page/search_page.dart';
import 'package:todo_flutter/pages/profile_page/profile_page.dart';
import 'package:todo_flutter/pages/tasks_page/tasks_page.dart';
import 'package:todo_flutter/pages/chart_page/chart_page.dart';

import '../chart_page/chart_page_test1.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _page = 0;

  final List<Widget> _pages = [
    const SearchPage(),
    ProgressPage(),
    const TasksPage(),
    ArticlesPage(), // Include your ArticlesPage here
    const ProfilePage(),
  ];

  bool _isOnTasksPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 55.0,
        items: <Widget>[
          const Icon(Icons.search, size: 30, color: Colors.white),
          Image.asset(
            'assets/icons/stats1.png',
            width: 28,
            height: 28,
          ),
          const Icon(Icons.add, size: 60, color: Colors.white),
          Image.asset(
            'assets/icons/jellyfish1.png',
            width: 28,
            height: 28,
          ),
          const Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        backgroundColor: const Color.fromRGBO(25, 25, 25, 0.8),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          if (index == 2) {
            if (_isOnTasksPage) {
              // Open the custom dialog if user is on TasksPage
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Add Item'),
                    content: Text('This is where you can add an item on TasksPage.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            } else {
              setState(() {
                _page = index;
              });
            }
          } else {
            // Update the variable based on the selected page
            _isOnTasksPage = _pages[index] is TasksPage;
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
