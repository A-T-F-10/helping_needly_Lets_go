import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/core/utils/getx_controller.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/core/widgets/list_info_please.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';
import 'package:helpings_needlys/models/info/Volunteers.dart';
import 'package:helpings_needlys/models/info/volunteer_show_dialog.dart';
import 'package:helpings_needlys/pages/homepage.dart';
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
          Card(
            elevation: 10,
            child: Column(
              children: [
                ListTile(
                  title: Text(TKeys().volunteers,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: SizeConfig.defaultSize! * controller.sizex,
                      )),
                ),
                const Divider(
                  thickness: 2,
                ),
                volunteersUser(
                  size: controller.sizex,
                  context: context,
                  volunteersText: volunteers[1],
                  volunteersgenders: volunteersgender[1],
                  volunteersNumber: 1,
                ),
                volunteersUser(
                    size: controller.sizex,
                    context: context,
                    volunteersText: volunteers[5],
                    volunteersgenders: volunteersgender[5],
                    volunteersNumber: 5),
                volunteersUser(
                    size: controller.sizex,
                    context: context,
                    volunteersText: volunteers[3],
                    volunteersgenders: volunteersgender[3],
                    volunteersNumber: 3),
                volunteersUser(
                    size: controller.sizex,
                    context: context,
                    volunteersText: volunteers[0],
                    volunteersgenders: volunteersgender[0],
                    volunteersNumber: 0),
                volunteersUser(
                    size: controller.sizex,
                    context: context,
                    volunteersText: volunteers[4],
                    volunteersgenders: volunteersgender[4],
                    volunteersNumber: 4),
                volunteersUser(
                    size: controller.sizex,
                    context: context,
                    volunteersText: volunteers[2],
                    volunteersgenders: volunteersgender[2],
                    volunteersNumber: 2),
              ],
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

  Widget volunteersUser({
    required String volunteersText,
    required String volunteersgenders,
    required int volunteersNumber,
    required BuildContext context,
    required double size,
  }) {
    return ListTile(
      onTap: () {
        showdailg(context, volunteersNumber);
      },
      subtitle: Text(volunteersgenders),
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(volunteersText,
          style: TextStyle(fontSize: SizeConfig.defaultSize! * size)),
      trailing: const Icon(Icons.call),
    );
  }
}
