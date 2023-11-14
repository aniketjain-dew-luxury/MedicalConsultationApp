import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/home_data.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.blue, // Background color for the card
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(16.0), // Adjust the radius as needed
      ),
      child: SizedBox(
        // height: 150, // Adjust the height as needed
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top left - Doctor circle image
                  CircleAvatar(
                    backgroundImage: NetworkImage(appointment
                        .imageURL), // Use the appointment's image URL
                    radius: 28.0,
                  ),
                  // Top right - Chat icon
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 28.0,
                        backgroundColor:
                            const Color.fromARGB(74, 255, 255, 255),
                        child: IconButton(
                          icon: const Icon(Icons.chat),
                          color: Colors.white,
                          onPressed: () {
                            // Handle chat icon tap
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment
                            .doctorName, // Use the appointment's doctor name
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        appointment
                            .speciality, // Use the appointment's speciality
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment
                            .appointmentTime, // Use the appointment's timing
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        appointment
                            .appointmentDate, // Use the appointment's date
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
