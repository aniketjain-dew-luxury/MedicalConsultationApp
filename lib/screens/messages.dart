import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<Message> messages = [];
  @override
  void initState() {
    super.initState();
    // Call the function to fetch data when the screen is initialized.
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        messages = data.map((message) => Message.fromJson(message)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return MessageCard(
            imagePath: '',
            title: messages[index].title,
            description: messages[index].body,
            time: 'xyz',
          );
        },
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String time;

  const MessageCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.0,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 30.0,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 6.0,
                  height: 6.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green, // or Colors.grey
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      description,
                      style: TextStyle(fontSize: 16.0),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Text(
                time,
                style: TextStyle(
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

class Message {
  final String title;
  final String body;

  Message({
    required this.title,
    required this.body,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      title: json['title'],
      body: json['body'],
    );
  }
}
