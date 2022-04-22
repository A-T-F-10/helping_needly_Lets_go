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
  required int idChatVolunteer,
  required String token,
}) async {
  await firestore.collection(collectionVolunteer).doc(documentVolunteer).set({
    'name': volunteerName,
    'email': volunteerEmail,
    'phone': volunteerPhone,
    'gender': volunteerGender,
    'token': token,
    'chatConter': idChatVolunteer
  });
}

void updateConters({
  required String collectionVolunteer,
  required String documentVolunteer,
  required int idChatVolunteer,
  required String keyConter,
}) async {
  await firestore
      .collection(collectionVolunteer)
      .doc(documentVolunteer)
      .update({keyConter: idChatVolunteer});
}

// to gat conters
getConters({
  required String collectionVolunteer,
  required String documentVolunteer,
  required String keyConter,
}) async {
  var idConter = await firestore
      .collection(collectionVolunteer)
      .doc(documentVolunteer)
      .get();
  return idConter[keyConter];
}

void createstUserChats({
  required String collectionVolunteer,
  required String documentVolunteer,
  required String collectionUser,
  required String email,
  required String message,
  required String token,
  required int conter,
}) async {
  await firestore
      .collection(collectionVolunteer)
      .doc(documentVolunteer)
      .collection(collectionUser)
      .doc("$conter" + email)
      .set({
    'conter': conter,
    'message': message,
    'token': token,
    'email': ModleGetDate.email,
    'name': ModleGetDate.username,
    'time': FieldValue.serverTimestamp(),
  });
}

void sendMessage({
  required String collection,
  required String document,
  required String collectionUser,
  required String name,
  required String email,
  required String message,
  required int conter,
}) async {
  await firestore
      .collection(collection)
      .doc(document)
      .collection(collectionUser)
      .doc('${++conter}' + ModleGetDate.email)
      .set({
    'name': name,
    'email': email,
    'message': message,
    'conter': conter,
    'time': FieldValue.serverTimestamp(),
  });
}

void updateContersUser({
  required String collectionVolunteer,
  required String documentVolunteer,
  required String collectionUser,
  required int idChatVolunteer,
  required String email,
}) async {
  await firestore
      .collection(collectionVolunteer)
      .doc(documentVolunteer)
      .collection(collectionUser)
      .doc("0" + email)
      .update({'conter': idChatVolunteer});
}

// to gat conters user
getContersUser({
  required String collectionVolunteer,
  required String documentVolunteer,
  required String collectionUser,
  required String email,
}) async {
  var conter = await firestore
      .collection(collectionVolunteer)
      .doc(documentVolunteer)
      .collection(collectionUser)
      .doc("0" + email)
      .get();

  return conter['conter'];
}

void createstUser({
  required String collectionUser,
  required String documentUser,
  required String volunteerName,
  required String volunteerEmail,
  required String token,
  required int idChatVolunteer,
}) async {
  await firestore.collection(collectionUser).doc(documentUser).set({
    'name': volunteerName,
    'email': volunteerEmail,
    'token': token,
    'chatConter': idChatVolunteer
  });
}

void createUserId(
    {required String collectionUser,
    required String docm,
    required int id}) async {
  await firestore.collection(collectionUser).doc(docm).set({'userId': id});
}
