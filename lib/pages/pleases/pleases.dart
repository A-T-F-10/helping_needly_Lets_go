import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/core/utils/getx_controller.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/pages/pleases/info_please.dart';

// ignore: must_be_immutable
class Pleases extends StatelessWidget {
  Pleases(
      {required this.lisr,
      required this.tkey,
      required this.imageList,
      Key? key})
      : super(key: key);
  List lisr = [];
  List imageList = [];

  String tkey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(tkey),
      ),
      body: ListView.builder(
          itemCount: lisr[0].length,
          itemBuilder: (context, itme) {
            return GetBuilder<ChengegetxController>(
                init: ChengegetxController(),
                builder: (controller) {
                  return Card(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth! / 25,
                        vertical: SizeConfig.screenHeight! / 100),
                    elevation: 10,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (__) => InofPlease(
                                  lisr,
                                  itme,
                                  imageListb: imageList,
                                )));
                      },
                      subtitle: Text(lisr[1][itme]),
                      trailing: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(imageList[itme]),
                      ),
                      title: Text(
                        lisr[0][itme],
                        style: TextStyle(
                            fontSize:
                                SizeConfig.defaultSize! * controller.sizex),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
