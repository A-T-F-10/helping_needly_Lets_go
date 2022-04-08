import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/chats/key_uesr.dart';
import 'package:helpings_needlys/chats/models/motheds_chats.dart';
import 'package:helpings_needlys/chats/models/volunteers_chats.dart';
import 'package:helpings_needlys/chats/widgets/chats_models.dart';
import 'package:helpings_needlys/core/utils/getx_controller.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';
import 'package:helpings_needlys/pages/volunteers/volunteers_setting.dart';

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
    return Scaffold(
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
                    itemCount: index.data!.docs.toList().length,
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
        int id = await getConters(
            collectionVolunteer: usersIdConter,
            documentVolunteer: email,
            keyConter: 'chatConter');

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
      subtitle: Text('مرحبا'),
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(volunteersName,
          style: TextStyle(fontSize: SizeConfig.defaultSize! * size)),
      trailing: const CircleAvatar(
        child: Text('1'),
      ),
    );
  }
}
