import 'package:flutter/material.dart';

import '../screens/search_screen.dart';

class FakeSearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the search screen when tapped
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                SearchScreen(), // Create a SearchScreen widget
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius:
              BorderRadius.circular(16.0), // Adjust the radius as needed
        ),
        height: 60,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: 40,
                color: Colors.grey,
              ),
              SizedBox(width: 4.0),
              Expanded(
                child: Text(
                  'Tap to search',
                  style: TextStyle(
                    color: Color.fromARGB(255, 233, 233, 233), fontSize: 16,
                    fontWeight: FontWeight.w600, // Make the text smaller
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
