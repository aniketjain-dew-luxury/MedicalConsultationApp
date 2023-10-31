import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeSelectionWidget extends StatefulWidget {
  final Function(int) onDateSelected;
  final Function(int) onTimeSelected;

  DateTimeSelectionWidget({
    required this.onDateSelected,
    required this.onTimeSelected,
  });

  @override
  _DateTimeSelectionWidgetState createState() =>
      _DateTimeSelectionWidgetState();
}

List<String> dateSlots = [
  "2023-11-01",
  "2023-11-02",
  "2023-11-03",
  "2023-11-04",
];

List<String> timeSlots = [
  "08:00 AM",
  "10:00 AM",
  "02:00 PM",
  "04:00 PM",
];

class _DateTimeSelectionWidgetState extends State<DateTimeSelectionWidget> {
  int selectedDateIndex = 0;
  int selectedTimeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              'Select Schedule',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dateSlots.length,
            itemBuilder: (context, index) {
              DateTime date = DateFormat('yyyy-MM-dd').parse(dateSlots[index]);
              String day = DateFormat('d').format(date);
              String dayName = DateFormat('E').format(date);

              return DateCard(
                day: day,
                dayName: dayName,
                isSelected: selectedDateIndex == index,
                onTap: () {
                  widget.onDateSelected(index);
                  // Handle date slot selection
                  setState(() {
                    selectedDateIndex = index;
                  });
                  print('Selected date: $dayName $day');
                  print('Selected date: ${dateSlots[index]}');
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16.0),
        const Row(
          children: [
            Text(
              'Select Time',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 55,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: timeSlots.length,
            itemBuilder: (context, index) {
              return TimeCard(
                time: timeSlots[index],
                isSelected: selectedTimeIndex == index,
                onTap: () {
                  widget.onTimeSelected(index);
                  // Handle time slot selection
                  setState(() {
                    selectedTimeIndex = index;
                  });
                  print('Selected time: ${timeSlots[index]}');
                },
              );
            },
          ),
        )
      ],
    );
  }
}

class DateCard extends StatelessWidget {
  final String day;
  final String dayName;
  final bool isSelected;
  final Function() onTap;

  DateCard({
    required this.day,
    required this.dayName,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(16), // Adjust the radius as needed
          color: isSelected
              ? Colors.blue
              : const Color.fromARGB(
                  20, 33, 149, 243), // Adjust the colors as needed
        ),
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.only(bottom: 4), // Add padding between rows

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? Colors.white
                          : Colors.grey, // Adjust text color
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 4), // Add padding between rows

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? Colors.white
                          : Colors.black, // Adjust text color
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeCard extends StatelessWidget {
  final String time;
  final bool isSelected;
  final Function() onTap;

  TimeCard({
    required this.time,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:
              isSelected ? Colors.blue : const Color.fromARGB(20, 33, 149, 243),
        ),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
