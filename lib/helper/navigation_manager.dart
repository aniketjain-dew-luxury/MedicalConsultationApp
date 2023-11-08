import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/home_data.dart';

class NavigationManager {
  static void navigateBackToHome(BuildContext context) {
    Navigator.pop(context);
  }

  static void navigateToAppointmentScreen(BuildContext context) {
    Navigator.pushNamed(context, '/appointment');
  }

  static void navigateToDoctorDetailScreen(
      BuildContext context, Doctor doctor) {
    Navigator.pushNamed(context, '/doctorDetail', arguments: doctor);
  }
}
