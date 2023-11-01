import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/home_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../widgets/appointment_card_message.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});
  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  List<Appointment> appointment = [];
  List<Appointment> filteredAppointments = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData().then((_) {
      filteredAppointments = appointment;
    });
  }

  void filterAppointments(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredAppointments = appointment;
      } else {
        filteredAppointments = appointment
            .where((appointment) => appointment.doctorName
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Future<void> fetchData() async {
    try {
      final List<Appointment> data = await getSavedAppointments();
      setState(() {
        appointment = data;
      });
    } catch (e) {
      setState(() {
        // Handle the error, e.g., display an error message
        // errorMessage = 'Failed to load data. Check your internet connection.';
      });
    }
  }

  Future<List<Appointment>> getSavedAppointments() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> encodedAppointments =
        prefs.getStringList('appointments') ?? [];
    final List<Appointment> savedAppointments = encodedAppointments
        .map((e) => Appointment.fromJson(json.decode(e)))
        .toList();

    return List.from(savedAppointments.reversed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Chat',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: (query) {
                          filterAppointments(query);
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            key: const Key('messageList'),
            child: ListView.builder(
              itemCount: filteredAppointments.length,
              itemBuilder: (context, index) {
                return AppointmentCard(
                  imagePath: filteredAppointments[index].imageURL,
                  title: filteredAppointments[index].doctorName,
                  description: "coming soon",
                  time: filteredAppointments[index].appointmentTime,
                  isOnline: filteredAppointments[index].isChatEnabled,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
