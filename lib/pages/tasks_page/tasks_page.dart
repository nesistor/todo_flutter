import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:todo_flutter/pages/tasks_page/page_widgets/custom_dialog.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<String> tasks = [];
  bool isDialogVisible = false;
  DateTime _selectedDay = DateTime.now();

  void _showTaskInput() {
    setState(() {
      isDialogVisible = true;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          onAddPressed: (String newTask, DateTime selectedDay) async {
            setState(() {
              tasks.add(newTask);
              _selectedDay = selectedDay;
            });
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
          selectedDayIndex: _selectedDay.weekday - 1,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Tasks',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Visibility(
            visible: !isDialogVisible,
            child: GestureDetector(
              onTap: _showTaskInput,
              child: Container(
                color: const Color.fromRGBO(25, 25, 25, 0.8),
                child: Center(
                  child: Text(
                    'Add your tasks for ${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year}',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: !isDialogVisible ? _showTaskInput : null,
                  child: Container(
                    color: const Color.fromRGBO(25, 25, 25, 0.8),
                    child: Center(
                      child: tasks.isEmpty
                          ? null
                          : ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              tasks[index],
                              style: const TextStyle(color: Colors.white),
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
