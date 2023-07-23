import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  int _selectedDayIndex = 0;
  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  void _previousDay() {
    setState(() {
      _selectedDayIndex = (_selectedDayIndex - 1) % daysOfWeek.length;
      if (_selectedDayIndex < 0) {
        _selectedDayIndex = daysOfWeek.length - 1;
      }
    });
  }

  void _nextDay() {
    setState(() {
      _selectedDayIndex = (_selectedDayIndex + 1) % daysOfWeek.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.black,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 44.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 44.0),
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: _previousDay,
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            daysOfWeek[_selectedDayIndex],
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                        onPressed: _nextDay,
                      ),
                      SizedBox(width: 44.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue, // Grey background color
              child: Center(
                child: Text(
                  'Rest of the screen content',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
