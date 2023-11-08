import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/home_data.dart';
import 'package:medical_consultation_app/widgets/doctor_card.dart';

class DoctorRecommendations extends StatelessWidget {
  final List<Doctor> doctors;

  const DoctorRecommendations({Key? key, required this.doctors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Doctors for You',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle "See All" button tap
                },
                child: const Text('See All'),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            return DoctorCard(doctor: doctors[index]);
          },
        ),
      ],
    );
  }
}
