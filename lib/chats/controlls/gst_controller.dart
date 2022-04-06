import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/chats/key_uesr.dart';

class ChatController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isSentByMe = true;
  int indexxx = 0;

  listenerChet() {
    return firestore.collection(textsUs).snapshots();
  }

  listenerVoluneets() {
    return firestore.collection(keyUserAll).snapshots();
  }
}
