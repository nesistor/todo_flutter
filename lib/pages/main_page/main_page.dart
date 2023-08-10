import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Use the correct package import

import 'package:todo_flutter/pages/article_page/article_page.dart';
import 'package:todo_flutter/pages/search_page/search_page.dart';
import 'package:todo_flutter/pages/profile_page/profile_page.dart';
import 'package:todo_flutter/pages/tasks_page/tasks_page.dart';
import 'package:todo_flutter/pages/chat_page/chat_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _page = 0;

  final List<Widget> _pages = [
    const SearchPage(),
    const ChatPage(),
    const TasksPage(),
    ArticlesPage(),
    const ProfilePage(),
  ];

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
