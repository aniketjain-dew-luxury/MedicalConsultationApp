import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Message.dart';

class MessageScreen extends StatefulWidget {
  static const String apiUrl = 'http://localhost:3000/consultations';
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<Consultation> messages = [];
  List<Consultation> filteredMessages = [];
  bool isLoading = true;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData().then((_) {
      filteredMessages = messages;
    });
  }

  void filterMessages(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredMessages = messages;
      } else {
        filteredMessages = messages
            .where((message) =>
                message.doctorName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Future<void> fetchData() async {
    isLoading = true;

    try {
      final response = await http.get(Uri.parse(MessageScreen.apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          messages = data
              .map((consultation) => Consultation.fromJson(consultation))
              .toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        // Handle the error, e.g., display an error message
        // errorMessage = 'Failed to load data. Check your internet connection.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Chat',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              onChanged: (query) {
                                filterMessages(query);
                              },
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  key: const Key('messageList'),
                  child: ListView.builder(
                    itemCount: filteredMessages.length,
                    itemBuilder: (context, index) {
                      return MessageCard(
                        imagePath: filteredMessages[index].imageURL,
                        title: filteredMessages[index].doctorName,
                        description:
                            filteredMessages[index].chatList[0].message,
                        time: filteredMessages[index].time,
                        isOnline: filteredMessages[index].isOnline,
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}

class MessageCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String time;
  final bool isOnline; // Add isOnline

  const MessageCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.time,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
      color: Colors.black, // Set label text color
    );
    TextStyle descriptionStyle = const TextStyle(
      fontSize: 16.0,
      color: Colors.grey, // Set description text color
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.0,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        imagePath), // Replace 'consultation' with your data
                    radius: 30.0,
                  ),
                  Positioned(
                    right: 3,
                    bottom: 5,
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: labelStyle,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      description,
                      style: descriptionStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
