import 'package:flutter/material.dart';
import 'package:todo_flutter/pages/tasks_page/page_widgets/custom_dialog.dart';
import 'package:todo_flutter/sqflite/repositories/database_repository.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;

  void _refreshJournals() async {
    final data = await DatabaseRepository.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
    print("..number of itmes ${_journals.length}");
  }

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

  List<String> tasks = [];
  bool isDialogVisible = false;

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

  void _showTaskInput() {
    setState(() {
      isDialogVisible = true;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          onAddPressed: (String newTask, int selectedDayIndex) {
            setState(() {
              tasks.add(newTask);
              _selectedDayIndex = selectedDayIndex;
            });
            Navigator.of(context).pop();
            setState(() {
              isDialogVisible = false;
            });
          },
          onCancelPressed: () {
            Navigator.of(context).pop();
            setState(() {
              isDialogVisible = false;
            });
          },
          selectedDayIndex: _selectedDayIndex,
          daysOfWeek: daysOfWeek,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Visibility(
            visible: !isDialogVisible,
            child: Center(
              child: Text(
                'Add your tasks',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Column(
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
                child: GestureDetector(
                  onTap: !isDialogVisible ? _showTaskInput : null,
                  child: Container(
                    color: Color.fromRGBO(25, 25, 25, 0.8),
                    child: Center(
                      child: tasks.isEmpty
                          ? null
                          : ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              tasks[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}