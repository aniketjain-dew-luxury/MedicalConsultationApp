import 'package:flutter/material.dart';
import 'package:medical_consultation_app/widgets/doctor_recommendations.dart';

import '../widgets/appointments_today_widget.dart';
import '../widgets/quick_links_widget.dart';
import '../widgets/user_info_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: const SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // User Info Widget
                  UserInfoWidget(
                    username: 'Hello Luke,',
                    status: 'How do you feel today?',
                    profileImageURL:
                        'https://via.placeholder.com/150', // Replace with the actual image URL
                  ),
                  // Add more widgets here
                  SizedBox(height: 16.0),
                  // Quick Links Widget
                  QuickLinksWidget(),
                  SizedBox(height: 16.0),
                  AppointmentsTodayWidget(),
                  DoctorRecommendations()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
