import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final void Function(String, int) onAddPressed;
  final VoidCallback onCancelPressed;
  int selectedDayIndex;
  final List<String> daysOfWeek;

  CustomDialog({
    required this.onAddPressed,
    required this.onCancelPressed,
    required this.selectedDayIndex,
    required this.daysOfWeek,
  });

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  String newTask = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color.fromRGBO(25, 25, 25, 0.8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add a task', style: TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            Flexible(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    newTask = value;
                  });
                },
                maxLines: null,
                decoration: InputDecoration(
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
            SizedBox(height: 10),
            DropdownButton<int>(
              value: widget.selectedDayIndex,
              onChanged: (int? newValue) {
                setState(() {
                  widget.selectedDayIndex = newValue!;
                });
              },
              items: widget.daysOfWeek
                  .asMap() // Convert the list to map with indices
                  .map((index, day) => MapEntry(
                index,
                DropdownMenuItem<int>(
                  value: index,
                  child: Text(day),
                ),
              ))
                  .values
                  .toList(),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    String selectedDay = widget.daysOfWeek[widget.selectedDayIndex];
                    widget.onAddPressed(newTask, widget.selectedDayIndex);
                  },
                  child: Text('Add'),
                ),
                TextButton(
                  onPressed: widget.onCancelPressed,
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


