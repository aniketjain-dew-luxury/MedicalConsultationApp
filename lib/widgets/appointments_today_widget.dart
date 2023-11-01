import 'dart:math';
import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/home_data.dart';
import 'package:medical_consultation_app/widgets/appointment_card_home.dart';

class AppointmentsTodayWidget extends StatefulWidget {
  final List<Appointment> appointments;
  const AppointmentsTodayWidget({Key? key, required this.appointments})
      : super(key: key);
  @override
  State<AppointmentsTodayWidget> createState() =>
      _AppointmentsTodayWidgetState();
}

class _AppointmentsTodayWidgetState extends State<AppointmentsTodayWidget> {
  bool expanded = false;
  int maxCards = 3; // Maximum number of cards to display in the collapsed state

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Heading Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Appointments Today',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              child: Text(
                expanded ? 'Hide All' : 'See All',
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        // List of Appointment Cards
        expanded
            ? ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: _buildAppointmentCards(),
              )
            : SizedBox(
                height: 180, // Adjust the height as needed
                child: Stack(
                  children: _buildStackedCards(),
                ),
              )
      ],
    );
  }

  List<Positioned> _buildStackedCards() {
    final List<Positioned> stackedCards = [];
    for (int i = min(maxCards, widget.appointments.length) - 1; i >= 0; i--) {
      if (i < widget.appointments.length) {
        final topPosition = i * 6.0; // Reverse the position
        final leftPosition = i * 3.0; // Reverse the position
        final rightPosition = i * 3.0; // Reverse the position
        final card = AppointmentCard(appointment: widget.appointments[i]);
        stackedCards.add(
          Positioned(
            top: topPosition,
            left: leftPosition,
            right: rightPosition,
            child: card,
          ),
        );
      }
    }
    return stackedCards;
  }

  List<Widget> _buildAppointmentCards() {
    final List<Widget> cards = [];
    for (int i = 0; i < widget.appointments.length; i++) {
      cards.add(AppointmentCard(appointment: widget.appointments[i]));
    }
    return cards;
  }
}
