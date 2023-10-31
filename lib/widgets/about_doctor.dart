import 'package:flutter/material.dart';

class AboutDoctorWidget extends StatefulWidget {
  const AboutDoctorWidget({super.key});

  @override
  _AboutDoctorWidgetState createState() => _AboutDoctorWidgetState();
}

class _AboutDoctorWidgetState extends State<AboutDoctorWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
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
                      'Dr. John Smith, Lorem ipsum dolor sit amet consectetur adipiscing elit. Suspendisse ut interdum ipsum, quis vulputate est. Proin nec arcu vel odio rhoncus vehicula, Phasellus at massa nec libero laoreet suscipit.',
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
