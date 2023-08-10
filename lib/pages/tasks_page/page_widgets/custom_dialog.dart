import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';


class CustomDialog extends StatefulWidget {
  final void Function(String, DateTime) onAddPressed;
  final VoidCallback onCancelPressed;
  int selectedDayIndex;

  CustomDialog({
    Key? key,
    required this.onAddPressed,
    required this.onCancelPressed,
    required this.selectedDayIndex,
  }) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  String newTask = '';
  final CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  bool _isCalendarExpanded = false;
  List<String> friendsOrTeams = [
    'Friend 1',
    'Friend 2',
    'Friend 3',
  ];

  void _showMultiSelect(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return MultiSelectBottomSheet(
          items: friendsOrTeams
              .map((item) => MultiSelectItem<String>(item, item))
              .toList(),
          initialValue: ['none'], // You can provide an initial value if needed
          onConfirm: (values) {
            // Handle selected friends/teams here
            if (values != null) {
              print('Selected Friends/Teams: $values');
              Navigator.pop(ctx); // Close the bottom sheet
            }
          },
          maxChildSize: 0.8,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromRGBO(25, 25, 25, 0.8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Add a task', style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 20),
            Flexible(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    newTask = value;
                  });
                },
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "title",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    newTask = value;
                  });
                },
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "description",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const  BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isCalendarExpanded = !_isCalendarExpanded;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    DateFormat('EEEE, MMMM d').format(_selectedDay), // Format to display day name, month, and day
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            if (_isCalendarExpanded) // Show the calendar if it's expanded
              Container(
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: TableCalendar(
                  calendarFormat: _calendarFormat,
                  focusedDay: _focusedDay,
                  firstDay: DateTime.utc(2023, 1, 1),
                  lastDay: DateTime.utc(2023, 12, 31),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  calendarStyle: const CalendarStyle(
                    defaultTextStyle: TextStyle(color: Colors.black),
                    weekendTextStyle: TextStyle(color: Colors.red),
                    selectedTextStyle: TextStyle(color: Colors.white),
                  ),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                ),
              ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _showMultiSelect(context);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'Share To',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120, // Set the desired width for both buttons
                  height: 40, // Set the desired height for both buttons
                  child: TextButton(
                    onPressed: widget.onCancelPressed,
                    style: TextButton.styleFrom(
                      disabledBackgroundColor: Colors.white, // Text color
                      backgroundColor: Colors.black, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text('Cancel', style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  width: 120, // Set the desired width for both buttons
                  height: 40, // Set the desired height for both buttons
                  child: TextButton(
                    onPressed: () {
                      widget.onAddPressed(newTask, _selectedDay);
                    },
                    style: TextButton.styleFrom(
                      disabledBackgroundColor: Colors.white, // Text color
                      backgroundColor: Colors.indigo.shade900, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text('Add', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

