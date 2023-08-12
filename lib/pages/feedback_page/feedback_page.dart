import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Feedback'),
        ),
        body: Container(
          color:  const Color.fromRGBO(25, 25, 25, 0.8),
        )
    );
  }
}
