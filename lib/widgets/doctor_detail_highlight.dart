import 'package:flutter/material.dart';

class DoctorDetailHighlight extends StatelessWidget {
  final String patients;
  final String experience;
  final String rating;

  const DoctorDetailHighlight({super.key, 
    required this.patients,
    required this.experience,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color.fromARGB(18, 33, 149, 243),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _HighlightColumn(label: 'Patients', value: patients),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: VerticalDivider(
              color: Colors.white,
              thickness: 1.0,
              width: 20.0,
            ),
          ),
          _HighlightColumn(label: 'Experience', value: experience),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: VerticalDivider(
              color: Colors.white,
              thickness: 1.0,
              width: 20.0,
            ),
          ),
          _HighlightColumn(label: 'Rating', value: rating),
        ],
      ),
    );
  }
}

class _HighlightColumn extends StatelessWidget {
  final String label;
  final String value;

  const _HighlightColumn({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            color: Color.fromARGB(50, 0, 0, 0),
          ),
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
