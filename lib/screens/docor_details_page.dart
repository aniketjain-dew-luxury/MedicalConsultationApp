import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/home_data.dart';

import 'package:medical_consultation_app/widgets/about_doctor.dart';
import 'package:medical_consultation_app/widgets/date_time_picker.dart';
import 'package:medical_consultation_app/widgets/doctor_detail_highlight.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

              const DoctorDetailHighlight(),
              const SizedBox(height: 16.0),

              AboutDoctorWidget(),
              const SizedBox(height: 16.0),

              DateTimeSelectionWidget(
                onDateSelected: handleDateSelection,
                onTimeSelected: handleTimeSelection,
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
                        title: Text('Appointment Confirmation'),
                        content: Text(
                            'Your appointment is scheduled for ${dateSlots[selectedDateIndex]} at ${timeSlots[selectedTimeIndex]}.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('Close'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform your appointment booking logic here
                              // You can also save the selected date and time to local storage.
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('Book Appointment'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Book Appointment'),
              ),
            ],
          ),
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
