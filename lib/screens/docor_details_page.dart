import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/home_data.dart';

import 'package:medical_consultation_app/widgets/about_doctor.dart';
import 'package:medical_consultation_app/widgets/date_time_picker.dart';
import 'package:medical_consultation_app/widgets/doctor_detail_highlight.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DoctorDetailScreen extends StatefulWidget {
  final Doctor doctor; // The doctor's data

  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  int selectedDateIndex = 0;

  int selectedTimeIndex = 0;

  void handleDateSelection(int index) {
    setState(() {
      selectedDateIndex = index;
    });
  }

  void handleTimeSelection(int index) {
    setState(() {
      selectedTimeIndex = index;
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              CircleAvatar(
                backgroundImage: NetworkImage(widget.doctor.imageURL),
                radius: 45.0, // Adjust the radius as needed
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.doctor.doctorName,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.doctor.speciality,
                style: const TextStyle(fontSize: 18.0, color: Colors.grey),
              ),
              // Add more doctor details here
              const SizedBox(height: 16.0),

              DoctorDetailHighlight(
                  patients: "1000",
                  experience: widget.doctor.yearsOfExperience.toString(),
                  rating: widget.doctor.rating.toString()),
              const SizedBox(height: 16.0),

              AboutDoctorWidget(about: widget.doctor.aboutDoctor),
              const SizedBox(height: 16.0),

              DateTimeSelectionWidget(
                onDateSelected: handleDateSelection,
                onTimeSelected: handleTimeSelection,
                dateSlots: widget.doctor.dateSlots,
                timeSlots: widget.doctor.timeSlots,
              ),
// Add the "Book Appointment" button
              // Add the ElevatedButton widget here
              ElevatedButton(
                onPressed: () {
                  // Handle the action when the button is pressed
                  // For example, you can show a confirmation dialog or navigate to another screen.
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Appointment Confirmation'),
                        content: Text(
                            'Your appointment is scheduled for ${widget.doctor.dateSlots[selectedDateIndex]} at ${widget.doctor.timeSlots[selectedTimeIndex]}.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text('Close'),
                          ),
                          TextButton(
                            onPressed: () {
                              bookAppointment(); // Call the bookAppointment function

                              // Perform your appointment booking logic here
                              // You can also save the selected date and time to local storage.
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text('Book Appointment'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Book Appointment'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveAppointment(Appointment appointment) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> encodedAppointments =
        prefs.getStringList('appointments') ?? [];

    encodedAppointments.add(json.encode(appointment.toJson()));
    await prefs.setStringList('appointments', encodedAppointments);
  }

  Future<void> bookAppointment() async {
    final Appointment appointment = Appointment(
      imageURL: widget.doctor.imageURL,
      doctorName: widget.doctor.doctorName,
      speciality: widget.doctor.speciality,
      isChatEnabled: true,
      appointmentDate: widget.doctor.dateSlots[selectedDateIndex],
      appointmentTime: widget.doctor.timeSlots[selectedTimeIndex],
    );

    await saveAppointment(appointment);

    // Perform any additional appointment booking logic here
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
