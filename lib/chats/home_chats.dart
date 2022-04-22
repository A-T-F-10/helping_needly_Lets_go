import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/chats/user_chats.dart';
import 'package:helpings_needlys/chats/widgets/chats_models.dart';
import 'package:helpings_needlys/chats/models/motheds_chats.dart';
import 'package:helpings_needlys/core/utils/getx_controller.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpings_needlys/chats/key_uesr.dart';
import 'package:helpings_needlys/sharedpreferances/keys_sharedpreferances.dart';
import 'package:helpings_needlys/sharedpreferances/modle_get_date.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeChats extends StatelessWidget {
  HomeChats({Key? key}) : super(key: key);

  Chats chats = Chats();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(TKeys().volunteers),
        ),
        body: Column(children: [
          Expanded(
            child: FutureBuilder<QuerySnapshot>(
                future: firestore.collection(keyUserAll).get(),
                builder: (context, index) {
                  if (!index.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return GetBuilder<ChengegetxController>(
                      init: ChengegetxController(),
                      builder: (con) {
                        return ListView.builder(
                          itemCount: index.data!.docs.toList().length,
                          itemBuilder: (context, i) {
                            return Card(
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: volunteersUser(
                                  volunteersName:
                                      "${index.data!.docs.toList()[i].get('name')}",
                                  email:
                                      '${index.data!.docs.toList()[i].get('email')}',
                                  volunteersNumber:
                                      "${index.data!.docs.toList()[i].get('phone')}",
                                  volunteersgenders: index.data!.docs
                                      .toList()[i]
                                      .get('gender'),
                                  chatsConter: index.data!.docs
                                      .toList()[i]
                                      .get('chatConter'),
                                  idConter: index.data!.docs
                                      .toList()[i]
                                      .get('idConter'),
                                  context: context,
                                  size: con.sizex,
                                ),
                              ),
                            );
                          },
                        );
                      });
                }),
          )
        ]));
  }

  Widget volunteersUser({
    required String email,
    required String volunteersName,
    required String volunteersNumber,
    required int volunteersgenders,
    required int chatsConter,
    required int idConter,
    required BuildContext context,
    required double size,
  }) {
    return ListTile(
      onTap: () async {
        int id = await getConters(
            collectionVolunteer: usersIdConter,
            documentVolunteer: ModleGetDate.email,
            keyConter: 'chatConter');
        chats.email = email;
        chats.name = volunteersName;
        chats.photoUrl = volunteersNumber;
        SharedPreferences preferences = await SharedPreferences.getInstance();

        try {
          await getContersUser(
              email: ModleGetDate.email,
              collectionVolunteer: keyUserAll,
              documentVolunteer: volunteersName + email,
              collectionUser: '$id' + chstUser);
        } catch (e) {
          createstUserChats(
            token: preferences.get(KeysSharedpreferances.TOKEN).toString(),
            email: ModleGetDate.email,
            collectionVolunteer: keyUserAll,
            documentVolunteer: volunteersName + email,
            collectionUser: "$id" + chstUser,
            message: 'مرحبا',
            conter: 0,
          );
        }

        Get.offUntil(
            MaterialPageRoute(
                builder: (context) => UserChats(
                      email: email,
                      idUser: id,
                      phone: volunteersNumber,
                      name: volunteersName,
                    )),
            (route) => true);
      },
      subtitle:
          volunteersgenders == 0 ? Text(TKeys().male) : Text(TKeys().female),
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(volunteersName,
          style: TextStyle(fontSize: SizeConfig.defaultSize! * size)),
      trailing: const Icon(Icons.message),
    );
  }
}
