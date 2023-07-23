import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Container(
          margin: EdgeInsets.all(30.0),
          height: 80.0,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft, // Align to the left
                child: Container(
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Align to the left
                    children: [
                      SizedBox(width: 10.0),
                      Icon(Icons.search, color: Colors.white), // Search icon
                      SizedBox(width: 8.0), // Add some spacing between Icon and Text
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(25, 25, 25, 0.8), // Grey interior color
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Color.fromRGBO(25, 25, 25, 0.8),
        child: Center(
          child: Text(
            'You can search for your friends to help them with tasks',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}


