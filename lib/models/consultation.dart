// class Consultation {
//   final String doctorId;
//   final String imageURL;
//   final String doctorName;
//   final bool consultationCompletion;
//   final bool isOnline;
//   final List<Message> chatList;
//   final String time;

//   Consultation({
//     required this.doctorId,
//     required this.imageURL,
//     required this.doctorName,
//     required this.consultationCompletion,
//     required this.isOnline,
//     required this.chatList,
//     required this.time,
//   });

//   factory Consultation.fromJson(Map<String, dynamic> json) {
//     return Consultation(
//       doctorId: json['doctor_id'],
//       imageURL: json['imageURL'],
//       doctorName: json['doctor_name'],
//       consultationCompletion: json['consultation_complition'],
//       isOnline: json['isonline'],
//       chatList: (json['chatList'] as List)
//           .map((message) => Message.fromJson(message))
//           .toList(),
//       time: json['time'],
//     );
//   }
// }

// class Message {
//   final int messageId;
//   final String message;
//   final String messageTiming;

//   Message({
//     required this.messageId,
//     required this.message,
//     required this.messageTiming,
//   });

//   factory Message.fromJson(Map<String, dynamic> json) {
//     return Message(
//       messageId: json['messageId'],
//       message: json['message'],
//       messageTiming: json['message_timing'],
//     );
//   }
// }
