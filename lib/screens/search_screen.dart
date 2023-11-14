import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: 'Search',
          ),
        ),
      ),
      body: Container(
          // Your search results or content for the search screen
          // You can display your search results or any other widgets here.
          ),
    );
  }
}
