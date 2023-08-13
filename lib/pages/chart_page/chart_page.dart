import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:todo_flutter/sqflite/database_helper.dart';

class ChartPage extends StatelessWidget {
  final List<Sector> sectors = []; // We'll populate this list with data from the database

  ChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Progress'),
        centerTitle: true,
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
    final int incompleteTasks = await DatabaseHelper().countIncompleteTasksFromYesterday();
    final int successfulTasks = await DatabaseHelper().countAllTasksComplete();

    // Clear the list and add new sectors
    sectors.clear();
    sectors.add(Sector(incompleteTasks.toDouble(), Colors.red, 'Incomplete Tasks')); // Kolor czerwony dla nieukończonych zadań
    sectors.add(Sector(successfulTasks.toDouble(), Colors.green, 'Successful Tasks')); // Kolor zielony dla ukończonych zadań
  }
  List<PieChartSectionData> _chartSections(List<Sector> sectors) {
    final List<PieChartSectionData> list = [];
    for (var sector in sectors) {
      const double radius = 40.0;
      final data = PieChartSectionData(
        color: sector.color,
        value: sector.value,
        radius: radius,
        title: sector.description, // Ustaw opis sektora jako tytuł
      );
      list.add(data);
    }
    return list;
  }
}

class Sector {
  final double value;
  final Color color;
  final String description; // Dodaj pole na opis sektora

  Sector(this.value, this.color, this.description);
}