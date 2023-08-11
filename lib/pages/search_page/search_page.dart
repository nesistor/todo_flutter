import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<Map<String, dynamic>> _searchResults = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchSubmitted(String value) async {
    setState(() {
      _searchQuery = value;
    });

    if (_searchQuery.isNotEmpty) {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('name', isGreaterThanOrEqualTo: _searchQuery)
          .where('name', isLessThanOrEqualTo: _searchQuery + '\uf8ff')
          .get();

      final List<Map<String, dynamic>> results = [];
      snapshot.docs.forEach((doc) {
        results.add(doc.data());
      });

      setState(() {
        _searchResults = results;
      });
    } else {
      setState(() {
        _searchResults = [];
      });
    }
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
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(25, 25, 25, 0.8),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10.0),
                      Icon(Icons.search, color: Colors.white),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
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
        child: _searchResults.isNotEmpty
            ? ListView.builder(
          itemCount: _searchResults.length,
          itemBuilder: (context, index) {
            final user = _searchResults[index];
            return ListTile(
              title: Text(user['name']),
              // You can customize the list tile as needed
            );
          },
        )
            : Center(
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


