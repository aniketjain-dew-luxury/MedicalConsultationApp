import 'package:flutter/material.dart';

class AppointmentsTodayWidget extends StatefulWidget {
  const AppointmentsTodayWidget({super.key});

  @override
  _AppointmentsTodayWidgetState createState() =>
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
                children: const [
                  AppointmentCard(),
                  AppointmentCard(),
                  AppointmentCard(),
                  // Add more AppointmentCard widgets as needed
                ],
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
      const card = AppointmentCard();
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
}

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

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
        height: 150, // Adjust the height as needed
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top left - Doctor circle image
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'doctor_image_url'), // Replace with the actual image URL
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Doctor Name',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Speciality',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Timing',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 16.0,
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
