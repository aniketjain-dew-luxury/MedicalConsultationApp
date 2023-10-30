import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/doctor.dart';
import 'package:medical_consultation_app/widgets/about_doctor.dart';
import 'package:medical_consultation_app/widgets/doctor_detail_highlight.dart';

class DoctorDetailScreen extends StatelessWidget {
  final Doctor doctor; // The doctor's data

  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            CircleAvatar(
              backgroundImage: NetworkImage(doctor.imageURL),
              radius: 60.0, // Adjust the radius as needed
            ),
            const SizedBox(height: 16.0),
            Text(
              doctor.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              doctor.speciality,
              style: const TextStyle(fontSize: 18.0),
            ),
            // Add more doctor details here
            const DoctorDetailHighlight(),
            AboutDoctorWidget()
          ],
        ),
      ),
    );
  }
}

// class Doctor {
//   final String imageURL;
//   final String name;
//   final String speciality;

//   Doctor({
//     required this.imageURL,
//     required this.name,
//     required this.speciality,
//   });
// }
