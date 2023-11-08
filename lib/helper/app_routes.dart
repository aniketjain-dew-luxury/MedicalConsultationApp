import 'package:flutter/material.dart';
import 'package:medical_consultation_app/screens/docor_details_page.dart';

import 'package:medical_consultation_app/screens/home_page.dart';
import 'package:medical_consultation_app/screens/tabbar_controller.dart';
import 'package:medical_consultation_app/screens/messages_page.dart';
import 'package:medical_consultation_app/screens/coming_soon.dart';

import '../models/home_data.dart';
// import 'package:medical_consultation_app/screens/docor_details_page.dart';

class AppRoutes {
  static const initialRoute = '/';
  static final routes = <String, WidgetBuilder>{
    initialRoute: (context) => const HomeTabBarScreen(),
    '/home': (context) => const HomePage(),
    '/appointment': (context) => const AppointmentScreen(),
    '/comingSoon': (context) => const ComingSoonScreen(),
    '/doctorDetail': (context) {
      final Doctor doctor =
          ModalRoute.of(context)!.settings.arguments as Doctor;
      return DoctorDetailScreen(doctor: doctor);
    }
  };
}
