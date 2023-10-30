import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/doctor.dart';
import 'package:medical_consultation_app/screens/docor_details_page.dart';

class DoctorRecommendations extends StatelessWidget {
  const DoctorRecommendations({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for doctor recommendations (replace with your data)
    final List<Doctor> doctors = [
      Doctor(
        imageURL: 'doctor_image_url_1',
        speciality: 'Cardiologist',
        name: 'Dr. John Smith',
        rating: 4.5,
        reviewCount: 35,
      ),
      Doctor(
        imageURL: 'doctor_image_url_2',
        speciality: 'Dermatologist',
        name: 'Dr. Jane Doe',
        rating: 4.8,
        reviewCount: 42,
      ),
      Doctor(
        imageURL: 'doctor_image_url_2',
        speciality: 'Dermatologist',
        name: 'Dr. Jane Doe',
        rating: 4.8,
        reviewCount: 42,
      ),
      Doctor(
        imageURL: 'doctor_image_url_2',
        speciality: 'Dermatologist',
        name: 'Dr. Jane Doe',
        rating: 4.8,
        reviewCount: 42,
      ),
      Doctor(
        imageURL: 'doctor_image_url_2',
        speciality: 'Dermatologist',
        name: 'Dr. Jane Doe',
        rating: 4.8,
        reviewCount: 42,
      ),
      Doctor(
        imageURL: 'doctor_image_url_2',
        speciality: 'Dermatologist',
        name: 'Dr. Jane Doe',
        rating: 4.8,
        reviewCount: 42,
      ),
      Doctor(
        imageURL: 'doctor_image_url_2',
        speciality: 'Dermatologist',
        name: 'Dr. Jane Doe',
        rating: 4.8,
        reviewCount: 42,
      ),
      Doctor(
        imageURL: 'doctor_image_url_2',
        speciality: 'Dermatologist',
        name: 'Dr. Jane Doe',
        rating: 4.8,
        reviewCount: 42,
      ),
      // Add more doctor data here
    ];

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

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Navigate to DoctorDetailScreen when tapping on the card
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DoctorDetailScreen(doctor: doctor),
            ),
          );
        },
        // onTap: () {
        //   showModalBottomSheet<void>(
        //     context: context,
        //     isScrollControlled: true,
        //     builder: (BuildContext context) {
        //       return DoctorDetailScreen(doctor: doctor);
        //     },
        //   );
        // },
        child: Card(
          elevation: 2,
          color: Colors.white, // Background color for the card
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8.0), // Adjust the radius as needed
          ),
          child: SizedBox(
            height: 150, // Adjust the card height as needed
            child: Row(
              children: [
                // Image on the left
                Container(
                  width: 150, // Set the width for the image
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(doctor.imageURL),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Doctor details in the remaining space
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.speciality,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          doctor.name,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Text(
                              doctor.rating.toString(),
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Text(
                          '${doctor.reviewCount} Reviews',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
