import 'package:flutter/material.dart';

class QuickLinksWidget extends StatelessWidget {
  const QuickLinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.0, // Set the desired height
      // color: Colors.lightBlue,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          QuickLinkItem(icon: Icons.local_hospital, title: 'Home'),
          QuickLinkItem(icon: Icons.add, title: 'Add'),
          QuickLinkItem(icon: Icons.message, title: 'Message'),
          QuickLinkItem(icon: Icons.settings, title: 'Settings'),
          // Add more QuickLinkItems as needed
        ],
      ),
    );
  }
}

class QuickLinkItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const QuickLinkItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0, // Set the desired width
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundColor:
                Colors.white, // Set the background color for the icon
            child: Icon(
              icon,
              color: Colors.red, // Set the icon color
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
