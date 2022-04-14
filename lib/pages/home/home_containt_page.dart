import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/chats/controlls/gst_controller.dart';
import 'package:helpings_needlys/core/utils/colors.dart';
import 'package:helpings_needlys/core/utils/getx_controller.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/core/widgets/search.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';
import 'package:helpings_needlys/models/info/images_list.dart';
import 'package:helpings_needlys/models/info/info.dart';
import 'package:helpings_needlys/pages/pleases/pleases.dart';
import 'package:helpings_needlys/pages/speech_mace.dart';
import '../../core/utils/colors.dart';

class HomeContaintPage extends StatelessWidget {
  const HomeContaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<ChengegetxController>(
        init: ChengegetxController(),
        builder: (con) {
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(
                  SizeConfig.defaultSize! / 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          size: SizeConfig.defaultSize! * 3.5,
                          color: ColorsTheme.darkPrimaryColor,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notification_important,
                          size: SizeConfig.defaultSize! * 3.5,
                          color: ColorsTheme.darkPrimaryColor,
                        )),
                  ],
                ),
              ),
              SizedBox(
                child: Image.asset(
                  'assets/images/Logo.png',
                ),
                height: SizeConfig.screenHeight! * .35,
              ),
              InkWell(
                onTap: () {
                  showSearch(context: context, delegate: Search());
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: ColorsTheme.darkPrimaryColor)),
                    width: SizeConfig.screenWidth! / 5,
                    height: SizeConfig.screenHeight! / 13,
                    padding: EdgeInsets.all(SizeConfig.screenHeight! / 90),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: ColorsTheme.darkPrimaryColor,
                        ),
                      ],
                    )),
              ),
              SizedBox(
                width: SizeConfig.screenWidth! * 10,
                child: Row(
                  children: [
                    places(TKeys().malls, () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Pleases(
                                imageList: marketsImages,
                                lisr: market,
                                tkey: TKeys().malls,
                              )));
                    }),
                    places(TKeys().restaurantsAndCoffees, () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Pleases(
                                imageList: resturantImages,
                                lisr: resturant,
                                tkey: TKeys().restaurantsAndCoffees,
                              )));
                    })
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Row(
                children: [
                  places(TKeys().entertainmentAndOtherLorem, () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Pleases(
                              imageList: parkImages,
                              lisr: park,
                              tkey: TKeys().entertainmentAndOtherLorem,
                            )));
                  }),
                  places(TKeys().hotelsAndChalets, () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Pleases(
                              imageList: horelsImages,
                              lisr: hotel,
                              tkey: TKeys().hotelsAndChalets,
                            )));
                  })
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          );
        });
  }

  Widget places(String places, var method) {
    return InkWell(
      onTap: method,
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 1.5)),
          color: ColorsTheme.darkPrimaryColor,
        ),
        child: GetBuilder<ChengegetxController>(
            init: ChengegetxController(),
            builder: (context) {
              return Text(
                places,
                style: TextStyle(
                  color: ColorsTheme.whiteColor,
                  fontSize: SizeConfig.defaultSize! * context.sizex,
                ),
                textAlign: TextAlign.center,
              );
            }),
        height: SizeConfig.screenHeight! / 10,
        width: SizeConfig.screenWidth! / 2.5,
        alignment: Alignment.center,
        margin: EdgeInsets.all(SizeConfig.defaultSize! / 1.2),
      ),
    );
  }
}
