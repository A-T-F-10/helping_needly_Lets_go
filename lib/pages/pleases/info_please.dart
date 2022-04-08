import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/chats/controlls/volunteers_cont.dart';
import 'package:helpings_needlys/chats/home_chats.dart';
import 'package:helpings_needlys/core/utils/colors.dart';
import 'package:helpings_needlys/core/utils/getx_controller.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/core/widgets/list_info_please.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';
import 'package:helpings_needlys/pages/homepage.dart';
import 'package:helpings_needlys/sharedpreferances/modle_get_date.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class InofPlease extends StatelessWidget {
  InofPlease(this.lisr, this.item, {required this.imageListb, Key? key})
      : super(key: key);
  int item;
  List lisr = [];
  List imageListb = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(lisr[0][item]),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (__) => const HomePage()),
                  (route) => false);
            },
          )
        ],
      ),
      body: GetBuilder<ChengegetxController>(
        init: ChengegetxController(),
        builder: (controller) => ListView(children: [
          SizedBox(
            child: Image.asset(imageListb[item]),
            height: SizeConfig.screenHeight! * 0.3,
          ),
          Card(
            elevation: 10,
            child: Column(
              children: [
                ListTile(
                    title: Text(
                  TKeys().information,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * controller.sizex,
                  ),
                )),
                const Divider(
                  thickness: 2,
                ),
                ListTile(
                  onTap: () async {
                    await launch(lisr[2][item]);
                  },
                  leading: Icon(Icons.location_on_outlined),
                  title: Text(lisr[1][item],
                      style: TextStyle(
                          fontSize:
                              SizeConfig.defaultSize! * controller.sizex)),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
          information(controller.sizex),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.09,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ColorsTheme.primaryColor)),
              onPressed: () {
                ModleGetDate().gett();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (__) => HomeChats()),
                );
              },
              child: Text(TKeys().volunteers,
                  style: TextStyle(
                      fontSize: SizeConfig.defaultSize! * controller.sizex)),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }

  Widget information(double sizeconfg) {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          listInfoPlease(
              icon: const Icon(Icons.child_care),
              title: TKeys().suitableforchildren,
              size: sizeconfg,
              yesOrNo: TKeys().yes),
          listInfoPlease(
              size: sizeconfg,
              icon: const Icon(Icons.hearing_disabled),
              title: TKeys().suitableforhearing,
              yesOrNo: TKeys().no),
          listInfoPlease(
              size: sizeconfg,
              icon: const Icon(Icons.remove_red_eye),
              title: TKeys().suitableforthevisually,
              yesOrNo: TKeys().yes),
          listInfoPlease(
              size: sizeconfg,
              icon: const Icon(Icons.nordic_walking_outlined),
              title: TKeys().suitableforthehandicapped,
              yesOrNo: TKeys().no),
          listInfoPlease(
              size: sizeconfg,
              icon: const Icon(Icons.music_note),
              title: TKeys().music,
              yesOrNo: TKeys().yes),
          listInfoPlease(
              size: sizeconfg,
              icon: const Icon(Icons.air_outlined),
              title: TKeys().outdoor,
              yesOrNo: TKeys().yes),
          listInfoPlease(
              size: sizeconfg,
              icon: const Icon(Icons.elevator_outlined),
              title: TKeys().elevator,
              yesOrNo: TKeys().yes),
        ],
      ),
    );
  }
}
