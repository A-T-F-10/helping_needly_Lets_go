import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/chats/controlls/gst_controller.dart';
import 'package:helpings_needlys/chats/key_uesr.dart';
import 'package:helpings_needlys/chats/widgets/chats_models.dart';
import 'package:helpings_needlys/chats/models/motheds_chats.dart';
import 'package:helpings_needlys/core/utils/colors.dart';
import 'package:helpings_needlys/sharedpreferances/modle_get_date.dart';

// ignore: must_be_immutable
class VolunteersChats extends StatelessWidget {
  VolunteersChats({
    Key? key,
    required this.name,
    required this.idUser,
    required this.email,
  }) : super(key: key);
  int idUser;
  String name;
  String email;

  @override
  List<Info> infoList = [];

  Info info = Info();

  final firestore = FirebaseFirestore.instance;
  TextEditingController controller = TextEditingController();

  OutlineInputBorder left = const OutlineInputBorder(
      borderRadius: BorderRadius.only(
    topRight: Radius.circular(50),
    bottomLeft: Radius.circular(50),
    bottomRight: Radius.circular(50),
  ));

  OutlineInputBorder right = const OutlineInputBorder(
      borderRadius: BorderRadius.only(
    topLeft: Radius.circular(50),
    bottomLeft: Radius.circular(50),
    bottomRight: Radius.circular(50),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GetBuilder<ChatController>(
              init: ChatController(),
              builder: (contr) => StreamBuilder<QuerySnapshot>(
                  stream: contr.listenerChet(
                      name: ModleGetDate.username,
                      email: ModleGetDate.email,
                      id: idUser),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        reverse: true,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount: snapshot.data!.docs.reversed.length,
                        itemBuilder: (context, index) {
                          return addWidgetText(
                            emailSender:
                                snapshot.data!.docs[index].get('email'),
                            info: Info(
                              nameSender:
                                  snapshot.data!.docs[index].get('name'),
                              text: snapshot.data!.docs[index].get('message'),
                            ),
                          );
                        });
                  }),
            ),
          ),
          inputAndButtomMessages(context)
        ],
      ),
    );
  }

  Widget inputAndButtomMessages(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: ColorsTheme.darkPrimaryColor,
            radius: 25,
            child: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () async {
                int conter = await getContersUser(
                    collectionVolunteer: keyUserAll,
                    documentVolunteer:
                        ModleGetDate.username + ModleGetDate.email,
                    collectionUser: '$idUser' + chstUser);

                print(conter);

                if (controller.text.isNotEmpty) {
                  sendMessage(
                    collection: keyUserAll,
                    document: ModleGetDate.username + ModleGetDate.email,
                    collectionUser: '$idUser' + chstUser,
                    conter: conter,
                    name: ModleGetDate.username,
                    email: ModleGetDate.email,
                    message: controller.text,
                  );

                  updateContersUser(
                    collectionVolunteer: keyUserAll,
                    documentVolunteer:
                        ModleGetDate.username + ModleGetDate.email,
                    collectionUser: '$idUser' + chstUser,
                    idChatVolunteer: ++conter,
                  );

                  controller.clear();
                }
              },
            ),
          ),
          textFieldWidget(context, controller: controller),
        ],
      ),
    );
  }

  Widget addWidgetText({required Info info, required String emailSender}) {
    return Align(
      alignment: ModleGetDate.email == emailSender
          ? Alignment.bottomRight
          : Alignment.bottomLeft,
      child: Column(
        children: [
          ModleGetDate.email == emailSender
              ? Text(ModleGetDate.username)
              : Text(name),
          Card(
            color: ModleGetDate.email == emailSender
                ? ColorsTheme.secondColor
                : ColorsTheme.darkPrimaryColor,
            shape: ModleGetDate.email == emailSender ? right : left,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(info.text,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

Widget textFieldWidget(BuildContext context,
    {required TextEditingController controller}) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(50)),
    width: MediaQuery.of(context).size.width / 1.28,
    child: TextField(
      controller: controller,
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintText: 'Type your message here...',
          enabledBorder: InputBorder.none,
          border: InputBorder.none),
      onSubmitted: (String text) {
        final message = Info(
          text: controller.text,
        );
      },
    ),
  );
}
