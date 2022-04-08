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

  Info({
    this.nameSender = '',
    this.text = '',
  });
}

class Chats {
  String photoUrl;
  String email;
  String name;

  Chats({
    this.photoUrl = '',
    this.email = '',
    this.name = '',
  });
}
