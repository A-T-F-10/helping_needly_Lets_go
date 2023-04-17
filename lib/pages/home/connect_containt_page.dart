import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/core/utils/colors.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectContaintPage extends StatelessWidget {
  const ConnectContaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color decorationColor = ColorsTheme.secondColor;
    Color borderColor = ColorsTheme.darkPrimaryColor;
    var widthContainer = SizeConfig.screenWidth! / 1.4;
    var heightContainer = SizeConfig.screenHeight! / 6;

    return Column(
      children: [
        Stack(alignment: AlignmentDirectional.topCenter, children: [
          Container(height: SizeConfig.screenHeight! / 5),
          Positioned(
            child: Container(
                height: SizeConfig.screenHeight! / 8,
                decoration: BoxDecoration(
                    color: ColorsTheme.darkPrimaryColor,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(500)))),
          ),
          Positioned(
            bottom: SizeConfig.screenHeight! / 50,
            child: const CircleAvatar(
              maxRadius: 50,
              backgroundImage:
                  AssetImage('assets/imagePleases/resturant/تميس.jpeg'),
            ),
          )
        ]),

        Text(TKeys().connect,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
        Divider(
          height: 20,
          color: Colors.grey,
          thickness: 1,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! / 50,
        ),
        Text(
          TKeys().aboutconntent,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: SizeConfig.screenHeight! / 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            columnCostem(
                onTap: () {
                  emailBoutton();
                },
                text: "Email",
                icon: Icon(
                  Icons.email,
                  color: Colors.white,
                )),
            columnCostem(
                onTap: () {
                  phoneBoutton();
                },
                text: "Call",
                icon: Icon(
                  Icons.phone,
                  color: Colors.white,
                )),
            columnCostem(
                onTap: () {},
                text: "Facebook",
                icon: Icon(
                  Icons.facebook,
                  color: Colors.white,
                )),
          ],
        ),
        SizedBox(
          height: SizeConfig.screenHeight! / 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            columnCostem(
                onTap: () {},
                text: "Telegram",
                icon: Icon(
                  Icons.telegram,
                  color: Colors.white,
                )),
            columnCostem(
                text: "Location",
                onTap: () {},
                icon: Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                )),
            columnCostem(
                onTap: () {},
                text: "Website",
                icon: Icon(
                  Icons.wechat,
                  color: Colors.white,
                )),
          ],
        )

        //////////////

        //     top: 0,
        //     right: 20,
        //     child: CircleAvatar(
        //       maxRadius: 30,
        //       backgroundColor: Colors.grey[800],
        //       child: Icon(Icons.contact_support, color: Colors.white),
        //     ),
        //   ),
        //   Container(
        //     height: SizeConfig.screenHeight! / 5,
        //     width: SizeConfig.screenWidth,
        //     decoration: BoxDecoration(
        //         color: Colors.grey[800],
        //         borderRadius: BorderRadius.circular(20)),
        //     child: Text(TKeys().connect),
        //   ),
        // ]),

        // InkWell(
        //   onTap: () => emailBoutton(),
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: decorationColor,
        //       border: Border.all(color: borderColor, width: 3),
        //       borderRadius: BorderRadius.circular(30),
        //     ),
        //     width: widthContainer,
        //     height: heightContainer,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Icon(
        //           Icons.email,
        //           size: 30,
        //           color: borderColor,
        //         ),
        //         Text(
        //           TKeys().email,
        //           style: TextStyle(fontSize: 20, color: ColorsTheme.blackColor),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // SizedBox(height: SizeConfig.screenHeight! / 20),
        // InkWell(
        // onTap: () => phoneBoutton(),
        // child: Container(
        //   decoration: BoxDecoration(
        //     color: decorationColor,
        //     border: Border.all(color: borderColor, width: 3),
        //     borderRadius: BorderRadius.circular(30),
        //   ),
        //     width: widthContainer,
        //     height: heightContainer,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Icon(
        //           Icons.call,
        //           size: 30,
        //           color: borderColor,
        //         ),
        //         Text(
        //           TKeys().phoneNumber,
        //           style: TextStyle(
        //             fontSize: 20,
        //             color: ColorsTheme.blackColor,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }

  emailBoutton() async {
    const email = 'rrooro710@gmail.com';
    Uri url = Uri(
        scheme: "mailto", path: email, queryParameters: {'subject': 'مرحبا'});
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    }
  }

  phoneBoutton() async {
    const urlPhone = 'tel: 0543473665';
    if (await canLaunch(urlPhone)) {
      await launch(urlPhone);
    }
  }

  columnCostem({required String text, required Icon icon, required onTap()}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: SizeConfig.screenHeight! / 10,
            width: SizeConfig.screenWidth! / 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: ColorsTheme.primaryColor,
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2)]),
            child: icon,
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight! / 50,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
