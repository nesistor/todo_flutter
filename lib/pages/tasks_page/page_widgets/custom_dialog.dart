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
  bool showDayList = false; // Set to true to show the list initially

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
            GestureDetector(
              onTap: () {
                setState(() {
                  showDayList = true;
                });
              },
              child: Container(
                height: 40, // Set the initial height to show only one day
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    widget.daysOfWeek[widget.selectedDayIndex],
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),
            if (showDayList)
              Container(
                height: 200, // Set the height to show the list of days
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  itemCount: widget.daysOfWeek.length,
                  itemBuilder: (context, index) {
                    String day = widget.daysOfWeek[index];
                    return ListTile(
                      title: Text(day),
                      onTap: () {
                        setState(() {
                          widget.selectedDayIndex = index;
                          showDayList = false; // Hide the list after selection
                        });
                      },
                    );
                  },
                ),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 120, // Set the desired width for both buttons
                  height: 40, // Set the desired height for both buttons
                  child: TextButton(
                    onPressed: widget.onCancelPressed,
                    style: TextButton.styleFrom(
                      primary: Colors.white, // Text color
                      backgroundColor: Colors.black, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text('Cancel'),
                  ),
                ),
                Container(
                  width: 120, // Set the desired width for both buttons
                  height: 40, // Set the desired height for both buttons
                  child: TextButton(
                    onPressed: () {
                      String selectedDay = widget.daysOfWeek[widget.selectedDayIndex];
                      widget.onAddPressed(newTask, widget.selectedDayIndex);
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white, // Text color
                      backgroundColor: Colors.indigo.shade900, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text('Add'),
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
