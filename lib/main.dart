import 'package:flutter/material.dart';
import 'package:medical_consultation_app/helper/app_routes.dart';
import 'package:medical_consultation_app/screens/tabbar_controller.dart';

void main() {
  runApp(const MedicalConsultationApp());
}

class MedicalConsultationApp extends StatelessWidget {
  const MedicalConsultationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Consultation App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        // Customize your theme here.
      ),
      debugShowCheckedModeBanner: false,
      // home: const HomeTabBarScreen(),
      initialRoute:
          AppRoutes.initialRoute, // Set the initial route from the route class
      routes: AppRoutes.routes, // Use the named routes from the route class
    );
  }
}
