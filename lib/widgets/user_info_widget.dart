import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final String username;
  final String status;
  final String profileImageURL;

  const UserInfoWidget({
    Key? key,
    required this.username,
    required this.status,
    required this.profileImageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Profile Image
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(status,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                )),
          ],
        ),

        const Spacer(),
        CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(profileImageURL),
        ),
        // User Info (Aligned)
      ],
    );
  }
}
