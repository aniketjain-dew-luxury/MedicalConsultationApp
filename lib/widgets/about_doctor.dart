import 'package:flutter/material.dart';

class AboutDoctorWidget extends StatelessWidget {
  final String about;
  const AboutDoctorWidget({
    super.key,
    required this.about,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              'About Doctor',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      about,
                      overflow: TextOverflow.visible,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
