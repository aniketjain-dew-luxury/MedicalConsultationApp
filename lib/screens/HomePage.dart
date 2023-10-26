import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home,
            size: 100.0,
            color: Colors.blue,
          ),
          Text(
            'Home Screen',
            style: TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    );
  }
}
