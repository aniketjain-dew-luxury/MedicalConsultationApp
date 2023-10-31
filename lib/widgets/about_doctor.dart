import 'package:flutter/material.dart';

class AboutDoctorWidget extends StatelessWidget {
  final String about;

  AboutDoctorWidget({
    required this.about,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      about,
                      overflow: TextOverflow.visible,
                      style: TextStyle(color: Colors.grey),
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
