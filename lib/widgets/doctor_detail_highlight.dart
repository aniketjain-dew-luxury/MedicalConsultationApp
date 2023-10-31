import 'package:flutter/material.dart';

class DoctorDetailHighlight extends StatelessWidget {
  const DoctorDetailHighlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Color.fromARGB(18, 33, 149, 243),
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
              fontSize: 16.0, color: Color.fromARGB(50, 0, 0, 0)),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
