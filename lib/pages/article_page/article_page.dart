import 'package:flutter/material.dart';

class ArticlesPage extends StatelessWidget {
  // Sample articles data
  final List<String> _articles = [
    "Article 1",
    "Article 2",
    "Article 3",
    "Article 4",
    "Article 5",
    // Add more articles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Articles'),
      ),
      body: Container(
        color: Color.fromRGBO(25, 25, 25, 0.8), // Set the background color of the entire page to black
        child: ListView.builder(
          itemCount: _articles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black, // Set the background color of the article to black
                  border: Border.all(color: Colors.indigo.shade900, width: 2), // Add a blue border around the article
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text(
                    _articles[index],
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  // You can add more information here for each article if needed
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
