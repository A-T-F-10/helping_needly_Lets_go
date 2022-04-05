import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/chats/controlls/gst_controller.dart';
import 'package:helpings_needlys/chats/key_uesr.dart';
import 'package:helpings_needlys/chats/widgets/chats_models.dart';
import 'package:helpings_needlys/chats/widgets/motheds_chats.dart';
import 'package:helpings_needlys/core/utils/colors.dart';
import 'package:helpings_needlys/sharedpreferances/modle_get_date.dart';

class UserChats extends StatefulWidget {
  const UserChats({Key? key}) : super(key: key);

  @override
  State<UserChats> createState() => _UserChatsState();
}

class _UserChatsState extends State<UserChats> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GetBuilder<ChatController>(
              init: ChatController(),
              builder: (contr) => StreamBuilder<QuerySnapshot>(
                  stream: contr.listenerChet(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        reverse: true,
                        addRepaintBoundaries: false,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return addWidgetText(
                            Info(
                              isSentByMe: false,
                              text:
                                  ' ${snapshot.data!.docs[index].get('name')}',
                            ),
                          );
                        });
                  }),
            ),
          ),
          inputAndButtomMessages(2)
        ],
      ),
    );
  }

  Widget inputAndButtomMessages(int indexId) {
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
              onPressed: () {
                ++indexId;
                createstUserChats(
                    collectionVolunteer: textsUs,
                    documentVolunteer:
                        ModleGetDate.email + '_' + '${indexId++}',
                    collectionUser:
                        ModleGetDate.email + ' User ' + ModleGetDate.username,
                    dateTime:
                        ' ${DateTime.now().hour.bitLength.floor().toString()} : ${DateTime.now().minute}',
                    usersName: ModleGetDate.username,
                    text: controller.text);

                controller.clear();
              },
            ),
          ),
          textFieldWidget(context, controller: controller),
        ],
      ),
    );
  }

  Widget addWidgetText(Info info) {
    return Align(
      alignment: info.isSentByMe ? Alignment.bottomLeft : Alignment.bottomRight,
      child: Card(
        color: info.isSentByMe ? ColorsTheme.darkPrimaryColor : Colors.white,
        shape: ModleGetDate.email == ModleGetDate.email ? right : left,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(info.text,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
        ),
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
          isSentByMe: true,
        );
      },
    ),
  );
}
