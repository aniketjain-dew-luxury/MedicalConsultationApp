import 'package:flutter/material.dart';

class DoctorDetailHighlight extends StatelessWidget {
  const DoctorDetailHighlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _HighlightColumn(label: 'Patients', value: '1056'),
            const Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 8.0), // Adjust the padding as needed
              child: VerticalDivider(
                color: Colors.white,
                thickness: 1.0,
                width: 20.0,
              ),
            ),
            _HighlightColumn(label: 'Experience', value: '10 yrs'),
            const Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 8.0), // Adjust the padding as needed
              child: VerticalDivider(
                color: Colors.white,
                thickness: 1.0,
                width: 20.0,
              ),
            ),
            _HighlightColumn(label: 'Rating', value: '4.8'),
          ],
        ),
      ),
    );
  }
}

class _HighlightColumn extends StatelessWidget {
  final String label;
  final String value;

  _HighlightColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
