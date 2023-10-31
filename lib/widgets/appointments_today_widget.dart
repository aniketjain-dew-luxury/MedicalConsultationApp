import 'package:flutter/material.dart';
import 'package:medical_consultation_app/models/home_data.dart';

class AppointmentsTodayWidget extends StatefulWidget {
  final List<Appointment> appointments;

  const AppointmentsTodayWidget({Key? key, required this.appointments})
      : super(key: key);

  @override
  _AppointmentsTodayWidgetState createState() =>
      _AppointmentsTodayWidgetState(appointments: appointments);
}

class _AppointmentsTodayWidgetState extends State<AppointmentsTodayWidget> {
  bool expanded = false;
  int maxCards = 3; // Maximum number of cards to display in the collapsed state
  final List<Appointment> appointments;

  _AppointmentsTodayWidgetState({required this.appointments});

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
    for (int i = maxCards - 1; i >= 0; i--) {
      final topPosition = i * 6.0; // Adjust the position as needed
      final leftPosition = i * 12.0; // Adjust the position as needed
      final rightPosition = i * 12.0; // Adjust the position as needed
      final card = AppointmentCard(appointment: appointments[i]);
      stackedCards.add(
        Positioned(
          top: topPosition,
          left: leftPosition,
          right: rightPosition,
          child: card,
        ),
      );
    }
    return stackedCards;
  }

  List<Widget> _buildAppointmentCards() {
    final List<Widget> cards = [];
    for (int i = 0; i < appointments.length; i++) {
      cards.add(AppointmentCard(appointment: appointments[i]));
    }
    return cards;
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.blue, // Background color for the card
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(16.0), // Adjust the radius as needed
      ),
      child: SizedBox(
        // height: 150, // Adjust the height as needed
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top left - Doctor circle image
                  CircleAvatar(
                    backgroundImage: NetworkImage(appointment
                        .imageURL), // Use the appointment's image URL
                    radius: 30.0,
                  ),
                  // Top right - Chat icon
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chat),
                        onPressed: () {
                          // Handle chat icon tap
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment
                            .doctorName, // Use the appointment's doctor name
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        appointment
                            .speciality, // Use the appointment's speciality
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment
                            .appointmentTime, // Use the appointment's timing
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        appointment
                            .appointmentDate, // Use the appointment's date
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
