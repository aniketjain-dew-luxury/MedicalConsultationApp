import 'package:flutter/material.dart';
import 'package:medical_consultation_app/helper/navigation_manager.dart';
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
        extendBodyBehindAppBar: true, // Make the AppBar transparent

        appBar: AppBar(
          title: const Text('Doctor Detail'),
          backgroundColor:
              Colors.transparent, // Set the AppBar background to transparent
          elevation: 0, // Remove the shadow

          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              NavigationManager.navigateBackToHome(context, "reload");

              // Navigator.of(context).pop(); // Navigate back to the previous screen
            },
          ),
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            backgroundContainer(),
            forgroundContainer(context),
          ],
        ));
  }

  Hero forgroundContainer(BuildContext context) {
    return Hero(
      flightShuttleBuilder: flightShuttleBuilder,
      tag: "doctor-${widget.doctor.doctorName}",
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50.0),
            margin: const EdgeInsets.only(top: 200.0),
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the rounded container
              borderRadius:
                  BorderRadius.circular(20.0), // Adjust the radius as needed
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 2.0), // Shadow offset
                  blurRadius: 6.0, // Shadow blur radius
                ),
              ],
            ),
            // color: Colors.green,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                      child: Column(
                        children: [
                          // const SizedBox(height: 16.0),
                          Text(
                            widget.doctor.doctorName,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.doctor.speciality,
                            style: const TextStyle(
                                fontSize: 18.0, color: Colors.grey),
                          ),
                          // Add more doctor details here
                          const SizedBox(height: 16.0),

                          DoctorDetailHighlight(
                              patients: "1000",
                              experience:
                                  widget.doctor.yearsOfExperience.toString(),
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
                                  return AppointmentConfirmationDialog(
                                    doctor: widget.doctor,
                                    selectedDateIndex: selectedDateIndex,
                                    selectedTimeIndex: selectedTimeIndex,
                                    onBookAppointment:
                                        bookAppointment, // Pass the callback
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
                ),
              ],
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.doctor.imageURL),
              radius: 45.0, // Adjust the radius as needed
            ),
          ),
        ],
      ),
    );
  }

  Widget flightShuttleBuilder(flightContext, animation, flightDirection,
      fromHeroContext, toHeroContext) {
    switch (flightDirection) {
      case HeroFlightDirection.push:
        return Material(color: Colors.transparent, child: toHeroContext.widget);
      case HeroFlightDirection.pop:
        return Material(
            color: Colors.transparent, child: fromHeroContext.widget);
      default:
        return const Text("data");
    }
  }

  Container backgroundContainer() {
    return Container(
      color: Colors.red,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // You can add an image or icon here
            Icon(
              Icons.timer,
              size: 100.0,
              color: Colors.blue,
            ),
            SizedBox(height: 20.0),
            Text(
              'Coming Soon',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'We are working on something awesome!',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ],
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
  }
}

class AppointmentConfirmationDialog extends StatelessWidget {
  final Doctor doctor;
  final int selectedDateIndex;
  final int selectedTimeIndex;
  final VoidCallback onBookAppointment;

  const AppointmentConfirmationDialog({
    super.key,
    required this.doctor,
    required this.selectedDateIndex,
    required this.selectedTimeIndex,
    required this.onBookAppointment,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Appointment Confirmation'),
      content: Text(
        'Your appointment is scheduled for ${doctor.dateSlots[selectedDateIndex]} at ${doctor.timeSlots[selectedTimeIndex]}.',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () {
            // Handle the appointment booking logic here
            onBookAppointment(); // Call the provided callback function
            Navigator.of(context).pop();
            NavigationManager.navigateBackToHome(context, 'reload');
          },
          child: const Text('Book Appointment'),
        ),
      ],
    );
  }
}
