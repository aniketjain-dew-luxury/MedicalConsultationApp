import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/home_data.dart';

class QuickLinksWidget extends StatelessWidget {
  final List<QuickLink> quickLinkItems;

  const QuickLinksWidget({
    Key? key,
    required this.quickLinkItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.0, // Set the desired height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: quickLinkItems.length,
        itemBuilder: (context, index) {
          final item = quickLinkItems[index];
          return QuickLinkItem(
            icon: getIcon(item.imageURL),
            title: item.title,
            color: getIconColor(item.imageURL),
          );
        },
      ),
    );
  }

  IconData getIcon(String iconData) {
    // Convert the icon string to an actual IconData
    switch (iconData) {
      case 'hospital':
        return Icons.local_hospital;
      case 'consultant':
        return Icons.emergency;
      case 'recipe':
        return Icons.receipt;
      case 'appointment':
        return Icons.book;
      // Add more icon mappings here for other icons you want to support
      default:
        return Icons.error; // Default to an error icon if not found
    }
  }

  Color getIconColor(String iconData) {
    switch (iconData) {
      case 'hospital':
        return Colors.red;
      case 'consultant':
        return Colors.blue;
      case 'recipe':
        return Colors.yellow;
      case 'appointment':
        return Colors.green;

      default:
        return Colors.red;
    }
  }
}

class QuickLinkItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const QuickLinkItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100.0, // Set the desired width
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
              color: color, // Set the icon color
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 159, 159, 159)),
          ),
        ],
      ),
    );
  }
}
