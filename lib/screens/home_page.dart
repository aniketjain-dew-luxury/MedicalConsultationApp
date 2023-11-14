import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/home_data.dart';
import 'package:medical_consultation_app/widgets/doctor_recommendations.dart';
import '../widgets/appointments_today_widget.dart';
import '../widgets/fake_search_bar_widget.dart';
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

  Future<HomeData?> _fetchHomeData() async {
    // Simulate an asynchronous API call with a delay.
    await Future.delayed(Duration(seconds: apiDelay.inSeconds));

    // Load JSON data from the file.
    final String jsonData = await rootBundle.loadString(homeDataJsonPath);

    // Parse the JSON data.
    homeData = HomeData.fromJson(json.decode(jsonData)['widgetList']);

    return homeData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
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
                      userInfoWidget(homeData),
                      const SizedBox(height: 20.0),
                      FakeSearchBarWidget(), // Use the FakeSearchBarWidget
                      const SizedBox(height: 20.0),
                      quickLinksWidget(homeData),
                      const SizedBox(height: 20.0),
                      appointmentsTodayWidget(homeData),
                      doctorRecommendationsWidget(homeData),
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
    return const AppointmentsTodayWidget();
  }

  DoctorRecommendations doctorRecommendationsWidget(HomeData? homeData) {
    return DoctorRecommendations(doctors: homeData?.doctorsRecommended ?? []);
  }

  @override
  void dispose() {
    // Dispose any resources here
    super.dispose();
  }
}
