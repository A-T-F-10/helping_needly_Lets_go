import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/chats/key_uesr.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';
import 'package:helpings_needlys/pages/volunteers/volunteers_setting.dart';

class VolunteersPage extends StatefulWidget {
  const VolunteersPage({Key? key}) : super(key: key);

  @override
  State<VolunteersPage> createState() => _VolunteersPageState();
}

class _VolunteersPageState extends State<VolunteersPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String s = firestore
              .collection(keyUserAll)
              .doc('Ahmed123456789')
              .get()
              .toString();

          print(s);
        },
        child: Icon(Icons.settings),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VolunteersSettingsPage()));
            },
            icon: Icon(Icons.settings),
          ),
        ],
        centerTitle: true,
        title: Text(TKeys().volunteers),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
