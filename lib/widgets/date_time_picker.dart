import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeSelectionWidget extends StatefulWidget {
  final Function(int) onDateSelected;
  final Function(int) onTimeSelected;
  final List<String> dateSlots;
  final List<String> timeSlots;

  const DateTimeSelectionWidget({
    super.key,
    required this.onDateSelected,
    required this.onTimeSelected,
    required this.dateSlots,
    required this.timeSlots,
  });

  @override
  State<DateTimeSelectionWidget> createState() =>
      _DateTimeSelectionWidgetState();
}

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
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.dateSlots.length,
            itemBuilder: (context, index) {
              DateTime date =
                  DateFormat('yyyy-MM-dd').parse(widget.dateSlots[index]);
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
            itemCount: widget.timeSlots.length,
            itemBuilder: (context, index) {
              return TimeCard(
                time: widget.timeSlots[index],
                isSelected: selectedTimeIndex == index,
                onTap: () {
                  widget.onTimeSelected(index);
                  // Handle time slot selection
                  setState(() {
                    selectedTimeIndex = index;
                  });
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

  const DateCard({
    super.key,
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
        width: 60,
        padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
        child: Card(
          margin: const EdgeInsets.all(0),
          elevation:
              isSelected ? 4 : 0, // Add elevation when the card is selected
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(16), // Adjust the radius as needed
          ),
          color:
              isSelected ? Colors.blue : const Color.fromARGB(20, 33, 149, 243),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.only(top: 14), // Add padding between rows
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
                    const EdgeInsets.only(top: 10), // Add padding between rows

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
      ),
    );
  }
}

class TimeCard extends StatelessWidget {
  final String time;
  final bool isSelected;
  final Function() onTap;

  const TimeCard({
    super.key,
    required this.time,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
        child: Card(
          margin: const EdgeInsets.all(0),

          elevation:
              isSelected ? 4 : 0, // Add elevation when the card is selected
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(16), // Adjust the radius as needed
          ),
          color:
              isSelected ? Colors.blue : const Color.fromARGB(20, 33, 149, 243),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16), // Add padding between rows
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
        ),
      ),
    );
  }
}
