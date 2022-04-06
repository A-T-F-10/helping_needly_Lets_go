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
  String nameSender;
  String timeSender;

  Info({
    this.nameSender = '',
    this.timeSender = '',
    this.text = '',
  });
}
