import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String time;
  final bool isOnline; // Add isOnline

  const AppointmentCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.time,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
      color: Colors.black, // Set label text color
    );
    TextStyle descriptionStyle = const TextStyle(
      fontSize: 16.0,
      color: Colors.grey, // Set description text color
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.0,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        imagePath), // Replace 'consultation' with your data
                    radius: 30.0,
                  ),
                  Positioned(
                    right: 3,
                    bottom: 5,
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: labelStyle,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      description,
                      style: descriptionStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
