import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/home_data.dart';
import 'package:medical_consultation_app/widgets/doctor_recommendations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/appointments_today_widget.dart';
import '../widgets/quick_links_widget.dart';
import '../widgets/user_info_widget.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<HomeData> _fetchHomeData() async {
    // Simulate an asynchronous API call with a delay.
    await Future.delayed(const Duration(seconds: 0));

    // Load JSON data from the file.
    final String jsonData =
        await rootBundle.loadString('assets/home_data.json');

    // Parse the JSON data.
    final homeData = HomeData.fromJson(json.decode(jsonData)['widgetList']);

    // Retrieve saved appointments from local storage
    final savedAppointments = await getSavedAppointments();

    // Update the appointments widget data with the saved appointments
    homeData.appointmentsWidget = savedAppointments;

    return homeData;
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
        body: FutureBuilder<HomeData>(
      future: _fetchHomeData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final homeData = snapshot.data;

          return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ListView(
                children: [
                  // Profile Widget
                  UserInfoWidget(
                    username: homeData?.profileWidget.name ?? '',
                    status: homeData?.profileWidget.feels ?? '',
                    profileImageURL: homeData?.profileWidget.imageURL ?? '',
                  ),
                  QuickLinksWidget(
                      quickLinkItems: homeData?.quickLinksWidget ?? []),
                  const SizedBox(height: 16.0),
                  Visibility(
                    visible: homeData?.appointmentsWidget.isEmpty != true,
                    child: AppointmentsTodayWidget(
                      appointments: homeData?.appointmentsWidget ?? [],
                    ),
                  ),
                  // AppointmentsTodayWidget(
                  //                 appointments: homeData?.appointmentsWidget ?? []),
                  DoctorRecommendations(
                    doctors: homeData?.doctorsRecommended ?? [],
                  )
                ],
              ));
        }
      },
    ));
  }
}
