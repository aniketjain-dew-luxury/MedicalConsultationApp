import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/home_data.dart';
import 'package:medical_consultation_app/screens/docor_details_page.dart';

class NavigationManager {
  static void navigateBackToHome(BuildContext context, String data) {
    Navigator.pop(context, data);
  }

  static void navigateToAppointmentScreen(BuildContext context) {
    Navigator.pushNamed(context, '/appointment');
  }

  static Future<String?> navigateToAsyncDoctorDetailPage(
      BuildContext context, Doctor doctor) async {
    final result = await Navigator.pushNamed<String?>(context, '/doctorDetail',
        arguments: doctor);
    return result; // Return a result if needed.
  }
}
