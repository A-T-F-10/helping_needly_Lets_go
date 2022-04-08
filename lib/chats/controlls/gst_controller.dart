import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/chats/key_uesr.dart';

class ChatController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isSentByMe = true;
  int indexxx = 0;

  listenerChet({required String name, required String email, required var id}) {
    return firestore
        .collection(keyUserAll)
        .doc(name + email)
        .collection('$id' + chstUser)
        .orderBy('time')
        .snapshots();
  }
}
