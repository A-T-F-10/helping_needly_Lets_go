import 'package:flutter/material.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';
import 'package:helpings_needlys/models/info/Volunteers.dart';

import 'package:url_launcher/url_launcher.dart';

showdailg(BuildContext context, int item) async {
  return await showDialog(
    context: context,
    builder: (context) => Dialog(
      elevation: 10,
      child: SizedBox(
          height: SizeConfig.screenHeight! * .44,
          child: Column(
            children: [
              Text(TKeys().volunteer,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * 2.8,
                  )),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenHeight! / 50),
                child: Row(
                  children: [
                    Text(TKeys().name + " : ",
                        style:
                            TextStyle(fontSize: SizeConfig.defaultSize! * 3)),
                    Text(volunteers[item],
                        style: TextStyle(fontSize: SizeConfig.defaultSize! * 3))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenHeight! / 50),
                child: Row(
                  children: [
                    Text(TKeys().age + " : ",
                        style:
                            TextStyle(fontSize: SizeConfig.defaultSize! * 3)),
                    Text(volunteersAge[item],
                        style: TextStyle(fontSize: SizeConfig.defaultSize! * 3))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenHeight! / 50,
                    vertical: SizeConfig.screenHeight! / 90),
                child: Row(
                  children: [
                    Text(TKeys().gender + " : ",
                        style:
                            TextStyle(fontSize: SizeConfig.defaultSize! * 3)),
                    Text(volunteersgender[item],
                        style: TextStyle(fontSize: SizeConfig.defaultSize! * 3))
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: SizeConfig.screenHeight! / 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green[500])),
                        label: Text("Whatsapp  "),
                        onPressed: () async {
                          try {
                            await launch(
                                "whatsapp://send?phone=${volunteersNumber[item]}");
                          } catch (e) {
                            {
                              print(e);
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.whatsapp,
                          color: Colors.white,
                        )),
                    ElevatedButton.icon(
                        label: Text("Call  "),
                        onPressed: () async {
                          try {
                            await launch("tel:${volunteersNumber[item]}");
                          } catch (e) {
                            print(e);
                          }
                        },
                        icon: Icon(Icons.call)),
                  ],
                ),
              )
            ],
          )),
    ),
  );
}
