import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchSubmitted(String value) {
    setState(() {
      _searchQuery = value;
      // Perform your search here with the search query (_searchQuery).
      // For example, you can filter a list of items based on the query.
      // searchResults = performSearch(_searchQuery);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Container(
          margin: const EdgeInsets.all(30.0),
          height: 80.0,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft, // Align to the left
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(25, 25, 25, 0.8), // Grey interior color
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Align to the left
                    children: [
                      SizedBox(width: 10.0),
                      Icon(Icons.search, color: Colors.white), // Search icon
                      SizedBox(width: 8.0), // Add some spacing between Icon and Text
                      Expanded(
                        // Use an expanded widget to make the TextField take up the available space
                        child: TextField(
                          controller: _searchController,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            border: InputBorder.none,
                          ),
                          onSubmitted: _onSearchSubmitted,
                          onChanged: (value) {
                            // You can handle changes as the user types here
                            // (e.g., show suggestions based on the partial query).
                          },
                        ),
                      ),
                    ],
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add functionality to handle the button press here.
          // For example, navigate to a page to create a new team.
        },
        label: Text('Create New Team'),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


