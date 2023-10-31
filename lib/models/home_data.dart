class HomeData {
  final ProfileWidget profileWidget;
  final bool searchBarWidget;
  final List<QuickLink> quickLinksWidget;
  final List<Appointment> appointmentsWidget;
  final List<Doctor> doctorsRecommended;

  HomeData({
    required this.profileWidget,
    required this.searchBarWidget,
    required this.quickLinksWidget,
    required this.appointmentsWidget,
    required this.doctorsRecommended,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      profileWidget: ProfileWidget.fromJson(json['profileWidget']),
      searchBarWidget: json['searchBarWidget'],
      quickLinksWidget: List<QuickLink>.from(
          json['quickLinksWidget'].map((x) => QuickLink.fromJson(x))),
      appointmentsWidget: List<Appointment>.from(
          json['appointmentsWidget'].map((x) => Appointment.fromJson(x))),
      doctorsRecommended: List<Doctor>.from(
          json['doctorsRecommended'].map((x) => Doctor.fromJson(x))),
    );
  }
}

class ProfileWidget {
  final String name;
  final String feels;
  final String imageURL;

  ProfileWidget({
    required this.name,
    required this.feels,
    required this.imageURL,
  });

  factory ProfileWidget.fromJson(Map<String, dynamic> json) {
    return ProfileWidget(
      name: json['name'],
      feels: json['feels'],
      imageURL: json['imageURL'],
    );
  }
}

class QuickLink {
  final String title;
  final String imageURL;

  QuickLink({
    required this.title,
    required this.imageURL,
  });

  factory QuickLink.fromJson(Map<String, dynamic> json) {
    return QuickLink(
      title: json['title'],
      imageURL: json['imageURL'],
    );
  }
}

class Appointment {
  final String imageURL;
  final String doctorName;
  final String speciality;
  final bool isChatEnabled;
  final String appointmentDate;
  final String appointmentTime;

  Appointment({
    required this.imageURL,
    required this.doctorName,
    required this.speciality,
    required this.isChatEnabled,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      imageURL: json['imageURL'],
      doctorName: json['doctorName'],
      speciality: json['speciality'],
      isChatEnabled: json['isChatEnabled'],
      appointmentDate: json['appointmentDate'],
      appointmentTime: json['appointmentTime'],
    );
  }
}

class Doctor {
  final String imageURL;
  final String doctorName;
  final String speciality;
  final double rating;
  final int reviewCount;

  Doctor({
    required this.imageURL,
    required this.doctorName,
    required this.speciality,
    required this.rating,
    required this.reviewCount,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      imageURL: json['imageURL'],
      doctorName: json['doctorName'],
      speciality: json['speciality'],
      rating: json['rating'],
      reviewCount: json['reviewCount'],
    );
  }
}
