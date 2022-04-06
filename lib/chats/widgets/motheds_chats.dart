import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpings_needlys/sharedpreferances/modle_get_date.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

void createstVolunteer({
  required String collectionVolunteer,
  required String documentVolunteer,
  required String volunteerName,
  required String volunteerEmail,
  required String volunteerPhone,
  required int volunteerGender,
}) async {
  await firestore.collection(collectionVolunteer).doc(documentVolunteer).set({
    'name': volunteerName,
    'email': volunteerEmail,
    'phone': volunteerPhone,
    'gender': volunteerGender,
  });
}

void createstUserChats(
    {required String collectionVolunteer,
    required String documentVolunteer,
    required String collectionUser,
    required String dateTime,
    required String usersName,
    required String text}) async {
  await firestore
      .collection(collectionVolunteer)
      .doc(documentVolunteer)
      .collection(collectionUser)
      .add({
    'chats': text,
    'date': dateTime,
    'name': ModleGetDate.username,
  });
}

void createstChats({
  required String collection,
  required String document,
  required String name,
  required String email,
  required String message,
  required String date,
}) async {
  await firestore.collection(collection).doc(document).set({
    'name': name,
    'email': email,
    'message': message,
    'date': date,
  });
}


/* 
    groupHeaderBuilder: (Info message) => SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: ColorsTheme.darkPrimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),





               elements: firestore.collection('ChatsApp').
              doc('chats@gmail.com').collection('Email@gmail.com').snapshots(),
              padding: const EdgeInsets.all(8),
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              groupBy: (message) => DateTime(
                message.date.year,
                message.date.month,
                message.date.day,
              ),
             

*/