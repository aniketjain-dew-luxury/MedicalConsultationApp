import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/home_data.dart';
import 'package:medical_consultation_app/screens/docor_details_page.dart';

class NavigationManager {
  static Future<String> navigateToAsyncDoctorDetailPage(
      BuildContext context, Doctor doctor) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DoctorDetailScreen(doctor: doctor)),
    );
    return result;
  }

  static void navigateBackToHome(BuildContext context, String data) {
    Navigator.pop(context, data);
  }
}
