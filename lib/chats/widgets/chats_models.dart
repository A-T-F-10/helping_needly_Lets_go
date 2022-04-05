class Message {
  static String collectionVolunteer = '';
  static String documentVolunteer = '';
  String volunteerName;
  String volunteerEmail;
  String volunteerPhone;
  String volunteerGender;
  Message({
    required this.volunteerName,
    required this.volunteerEmail,
    required this.volunteerPhone,
    required this.volunteerGender,
  });
}

class Info {
  String text;
  bool isSentByMe;

  Info({
    this.text = '',
    this.isSentByMe = true,
  });
}
