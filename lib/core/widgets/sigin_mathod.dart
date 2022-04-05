import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final formkey = GlobalKey<FormState>();

Future signinWithEmailandPass(BuildContext context,
    {String? email, String? password}) async {
  final firebaseAuth = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email!, password: password!);
  try {
    return firebaseAuth;
  } on FirebaseAuthException catch (e) {
    Utils.showSnackBar(e.message);
  }
}

Future createnWithEmailandPass(BuildContext context,
    {required String email, required String password}) async {
  return await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
}

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Color.fromARGB(255, 66, 43, 41),
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
