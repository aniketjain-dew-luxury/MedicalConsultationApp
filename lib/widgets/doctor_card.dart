import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/home_data.dart';
import 'package:medical_consultation_app/screens/docor_details_page.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard(
      {super.key, required this.doctor, required this.methodFromParent});
  final Function(BuildContext context, Doctor doctor)? methodFromParent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // methodFromParent?.call(context, doctor);

          //  navidateToDoctorDetails(context, doctor);
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
        child: Hero(
          tag: "doctor-${doctor.doctorName}",
          child: Card(
            elevation: 2,
            color: Colors.white, // Background color for the card
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8.0), // Adjust the radius as needed
            ),
            child: SizedBox(
              height: 120, // Adjust the card height as needed
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Container(
                      width: 100, // Set the width for the image
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(doctor.imageURL),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the radius as needed
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
                            doctor.doctorName,
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
                              Text(
                                '  |  ${doctor.reviewCount} Reviews',
                                style: const TextStyle(fontSize: 16.0),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
