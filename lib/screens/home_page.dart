import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:medical_consultation_app/helper/navigation_manager.dart';
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
  static const String homeDataJsonPath = 'assets/home_data.json';
  static const Duration apiDelay = Duration(seconds: 0);

  late HomeData? homeData;

  @override
  void initState() {
    super.initState();
    _fetchHomeData();
  }

  Future<void> _loadDataFromLocalStorage() async {
    // Retrieve saved appointments from local storage
    final savedAppointments = await getSavedAppointments();
    // Update the appointments widget data with the saved appointments
    setState(() {
      homeData?.appointmentsWidget = savedAppointments;
    });
  }

  Future<void> navidateToDoctorDetails(
      BuildContext context, Doctor doctor) async {
    final isReload = await NavigationManager.navigateToAsyncDoctorDetailPage(
        context, doctor);
    if (!mounted) {
      return;
    }
    if (isReload == "reload") {
      _loadDataFromLocalStorage();
    }
  }

  Future<HomeData?> _fetchHomeData() async {
    // Simulate an asynchronous API call with a delay.
    await Future.delayed(Duration(seconds: apiDelay.inSeconds));

    // Load JSON data from the file.
    final String jsonData = await rootBundle.loadString(homeDataJsonPath);

    // Parse the JSON data.
    homeData = HomeData.fromJson(json.decode(jsonData)['widgetList']);

    // Retrieve saved appointments from local storage
    final savedAppointments = await getSavedAppointments();

    // Update the appointments widget data with the saved appointments
    homeData?.appointmentsWidget = savedAppointments;

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
        body: FutureBuilder<HomeData?>(
      future: _fetchHomeData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final homeData = snapshot.data;

          return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ListView(
                children: [
                  // Profile Widget
                  userInfoWidget(homeData),
                  quickLinksWidget(homeData),
                  const SizedBox(height: 16.0),
                  Visibility(
                    visible: homeData?.appointmentsWidget.isEmpty != true,
                    child: appointmentsTodayWidget(homeData),
                  ),
                  doctorRecommendationsWidget(homeData)
                ],
              ));
        }
      },
    ));
  }

  UserInfoWidget userInfoWidget(HomeData? homeData) {
    return UserInfoWidget(
      username: homeData?.profileWidget.name ?? '',
      status: homeData?.profileWidget.feels ?? '',
      profileImageURL: homeData?.profileWidget.imageURL ?? '',
    );
  }

  QuickLinksWidget quickLinksWidget(HomeData? homeData) {
    return QuickLinksWidget(quickLinkItems: homeData?.quickLinksWidget ?? []);
  }

  AppointmentsTodayWidget appointmentsTodayWidget(HomeData? homeData) {
    return AppointmentsTodayWidget(
      appointments: homeData?.appointmentsWidget ?? [],
    );
  }

  DoctorRecommendations doctorRecommendationsWidget(HomeData? homeData) {
    return DoctorRecommendations(
      doctors: homeData?.doctorsRecommended ?? [],
      methodFromParent: navidateToDoctorDetails,
    );
  }

  @override
  void dispose() {
    // Dispose any resources here
    super.dispose();
  }
}
