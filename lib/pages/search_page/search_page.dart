import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false, // Ustawiamy kolor tła na czarny
        title: TextField(
          style:
              TextStyle(color: Colors.white), // Ustawiamy kolor tekstu na biały
          decoration: InputDecoration(
            hintText: 'Search', // Tekst podpowiedzi w polu wyszukiwania
            hintStyle:
                TextStyle(color: Colors.grey), // Kolor tekstu podpowiedzi
            border: InputBorder.none, // Usuwamy obramowanie pola wyszukiwania
          ),
        ),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            'You can search for your friends to help them with tasks',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
