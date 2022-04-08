import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/chats/key_uesr.dart';

class VolunteersController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  listenerVoluneets() async {
    Map<String, dynamic> map = {};

    await firestore.collection(keyUserAll).get().then((value) {
      value.docs.forEach((element) {
        map[element.id] = element.data();
      });
    });
    return map;
  }
}
