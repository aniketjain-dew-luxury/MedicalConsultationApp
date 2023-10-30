import 'package:flutter/material.dart';

class AboutDoctorWidget extends StatefulWidget {
  const AboutDoctorWidget({super.key});

  @override
  _AboutDoctorWidgetState createState() => _AboutDoctorWidgetState();
}

class _AboutDoctorWidgetState extends State<AboutDoctorWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'About Doctor',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      'Dr. John Smith'
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Suspendisse ut interdum ipsum, quis vulputate est. Proin nec arcu vel odio rhoncus vehicula. '
                      'Phasellus at massa nec libero laoreet suscipit.',
                      maxLines: isExpanded ? null : 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Text(
                      isExpanded ? 'Read Less' : 'Read More',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
