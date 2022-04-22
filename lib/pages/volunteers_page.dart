import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/chats/key_uesr.dart';
import 'package:helpings_needlys/chats/models/motheds_chats.dart';
import 'package:helpings_needlys/chats/models/volunteers_chats.dart';
import 'package:helpings_needlys/chats/widgets/chats_models.dart';
import 'package:helpings_needlys/core/utils/colors.dart';
import 'package:helpings_needlys/core/utils/getx_controller.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';
import 'package:helpings_needlys/pages/volunteers/login_volunteer.dart';
import 'package:helpings_needlys/sharedpreferances/keys_sharedpreferances.dart';
import 'package:helpings_needlys/sharedpreferances/modle_get_date.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VolunteersPage extends StatefulWidget {
  const VolunteersPage({Key? key}) : super(key: key);

  @override
  State<VolunteersPage> createState() => _VolunteersPageState();
}

class _VolunteersPageState extends State<VolunteersPage> {
  Chats chats = Chats();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map map = {};

  @override
  Widget build(BuildContext context) {
    ModleGetDate().gett();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! / 15),
            icon: const Icon(Icons.logout),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (__) {
                    return Dialog(
                      child: SizedBox(
                          height: 180,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(TKeys().logout),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(TKeys().areyoursurelogout),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton.icon(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                ColorsTheme.darkPrimaryColor)),
                                    onPressed: () async {
                                      SharedPreferences preferences =
                                          await SharedPreferences.getInstance();

                                      preferences
                                          .remove(KeysSharedpreferances.EMAIL);
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const VolunteersLogIn()),
                                          (route) => false);
                                    },
                                    icon: const Icon(Icons.logout),
                                    label: Text(TKeys().logout),
                                  ),
                                  ElevatedButton.icon(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(Icons.cancel),
                                    label: Text(TKeys().cancel),
                                  ),
                                ],
                              )
                            ],
                          )),
                    );
                  });
            },
          )
        ],
        centerTitle: true,
        title: Text(TKeys().volunteers),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: firestore.collection(usersIdConter).snapshots(),
          builder: (context, index) {
            if (!index.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return GetBuilder<ChengegetxController>(
                init: ChengegetxController(),
                builder: (con) {
                  return ListView.builder(
                    itemCount: index.data!.docs.reversed.toList().length,
                    itemBuilder: (context, i) {
                      return Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: usersMothed(
                              chatsConter: index.data!.docs
                                  .toList()[i]
                                  .get('chatConter'),
                              context: context,
                              email:
                                  "${index.data!.docs.toList()[i].get('email')}",
                              size: con.sizex,
                              volunteersName:
                                  "${index.data!.docs.toList()[i].get('name')}"),
                        ),
                      );
                    },
                  );
                });
          }),
    );
  }

  Widget usersMothed({
    required String email,
    required String volunteersName,
    required int chatsConter,
    required BuildContext context,
    required double size,
  }) {
    return ListTile(
      onTap: () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        int id = await getConters(
            collectionVolunteer: usersIdConter,
            documentVolunteer: email,
            keyConter: 'chatConter');

        try {
          await getContersUser(
              email: email,
              collectionVolunteer: keyUserAll,
              documentVolunteer: ModleGetDate.username + ModleGetDate.email,
              collectionUser: '$id' + chstUser);
        } catch (e) {
          createstUserChats(
            token: preferences.get(KeysSharedpreferances.TOKEN).toString(),
            collectionVolunteer: keyUserAll,
            documentVolunteer: volunteersName + email,
            collectionUser: "$id" + chstUser,
            email: email,
            message: 'مرحبا',
            conter: 0,
          );
        }

        chats.email = email;
        chats.name = volunteersName;
        Get.offUntil(
            MaterialPageRoute(
                builder: (context) => VolunteersChats(
                      email: email,
                      idUser: id,
                      name: volunteersName,
                    )),
            (route) => true);
      },
      subtitle: const Text('مرحبا'),
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(volunteersName,
          style: TextStyle(fontSize: SizeConfig.defaultSize! * size)),
      trailing: const CircleAvatar(
        child: Text('1'),
      ),
    );
  }
}
