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
                            emailSender:
                                snapshot.data!.docs[index].get('email'),
                            info: Info(
                              nameSender:
                                  snapshot.data!.docs[index].get('name'),
                              text: snapshot.data!.docs[index].get('message'),
                              timeSender:
                                  ' ${snapshot.data!.docs[index].get('date')}',
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
                indexId = ++indexId;
                createstChats(
                  collection: textsUs,
                  document: ModleGetDate.email + '_' + '${indexId}',
                  email: ModleGetDate.email,
                  date:
                      ' ${DateTime.now().hour.bitLength.floor().toString()} : ${DateTime.now().minute}',
                  message: controller.text,
                  name: ModleGetDate.username,
                );

                controller.clear();
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
      child: Card(
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
