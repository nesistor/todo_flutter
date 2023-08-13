import 'package:flutter/material.dart';

import 'chart_page_test.dart';
// Adjust the import path based on your project structure

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Progress Page'),
        centerTitle: true,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20), // Add some spacing at the top
          PieChartSample(), // Your chart widget
        ],
      ),
    );
  }
}
