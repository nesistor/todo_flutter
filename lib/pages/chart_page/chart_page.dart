import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:todo_flutter/sqflite/database_helper.dart'; // Make sure to import the correct path to your DatabaseHelper

class ChartPage extends StatelessWidget {
  final List<Sector> sectors = []; // We'll populate this list with data from the database

  ChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Progress'),
      ),
      body: Container(
        color: Color.fromRGBO(25, 25, 25, 0.8),
        child: FutureBuilder(
          future: _fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return AspectRatio(
                aspectRatio: 1.0,
                child: PieChart(PieChartData(
                  sections: _chartSections(sectors),
                  centerSpaceRadius: 48.0,
                )),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _fetchData() async {
    final int incompleteTasks = await DatabaseHelper().countIncompleteTasks();
    final int successfulTasks = await DatabaseHelper().countSuccessfulTasks();

    // Clear the list and add new sectors
    sectors.clear();
    sectors.add(Sector(incompleteTasks.toDouble(), Colors.red));
    sectors.add(Sector(successfulTasks.toDouble(), Colors.green));
  }

  List<PieChartSectionData> _chartSections(List<Sector> sectors) {
    final List<PieChartSectionData> list = [];
    for (var sector in sectors) {
      const double radius = 40.0;
      final data = PieChartSectionData(
        color: sector.color,
        value: sector.value,
        radius: radius,
        title: '',
      );
      list.add(data);
    }
    return list;
  }
}

class Sector {
  final double value;
  final Color color;

  Sector(this.value, this.color);
}
