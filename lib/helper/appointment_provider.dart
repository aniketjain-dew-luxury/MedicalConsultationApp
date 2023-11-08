import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/home_data.dart';

class AppointmentProvider extends ChangeNotifier {
  // final List<Appointment> _appointmentList = [];

  Future<List<Appointment>> getAppointmentList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> encodedAppointments =
        prefs.getStringList('appointments') ?? [];

    final List<Appointment> savedAppointments = encodedAppointments
        .map((e) => Appointment.fromJson(json.decode(e)))
        .toList();

    return List.from(savedAppointments.reversed);
  }

  Future<void> addAppointment(Appointment appointment) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> encodedAppointments =
        prefs.getStringList('appointments') ?? [];

    encodedAppointments.add(json.encode(appointment.toJson()));
    await prefs.setStringList('appointments', encodedAppointments);
    notifyListeners();
  }
}
