import 'package:flutter/material.dart';
import 'package:medical_consultation_app/screens/coming_soon.dart';
import 'package:medical_consultation_app/screens/home_page.dart';
import 'messages_page.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabbarScreenState createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomePage(),
    const ComingSoonScreen(),
    const ComingSoonScreen(),
    const AppointmentScreen(),
    const ComingSoonScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Medical Consultation App'),
      // ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed, // Use this for more than 3 tabs
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Receipt',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        onTap: _onTabTapped,
      ),
    );
  }
}
