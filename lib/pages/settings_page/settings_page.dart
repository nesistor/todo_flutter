import 'package:flutter/material.dart';
import 'package:todo_flutter/custom_widgets/custom_black_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Settings'),
      ),
      body: Container(
        color: const Color.fromRGBO(25, 25, 25, 0.8),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomProfileButton(
                onPressed: () {},
                text: "Download file with tasks for the calendar",
                icon: const Icon(Icons.calendar_month)),
            const SizedBox(height: 12),
            CustomProfileButton(
                onPressed: () {},
                text: "Download tasks from trello",
                icon: const Icon(Icons.download)),
            const Spacer(),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
        ],
        ),
      ),
    );
  }
}
