import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/chats/key_uesr.dart';

class ChatController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isSentByMe = true;
  int indexxx = 0;

  listenerChet() {
    // firestore.collection().doc('qxf').collection.toString();

    return firestore.collection(keyUserAll).snapshots();
  }

  listenerVoluneets() {
    return firestore.collection(keyUserAll).doc().snapshots();
  }
}
