import 'package:flutter/material.dart';
import 'package:helpings_needlys/core/utils/colors.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => emailBoutton(),
          child: Container(
            decoration: BoxDecoration(
              color: decorationColor,
              border: Border.all(color: borderColor, width: 3),
              borderRadius: BorderRadius.circular(30),
            ),
            width: widthContainer,
            height: heightContainer,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email,
                  size: 30,
                  color: borderColor,
                ),
                Text(
                  'Email',
                  style: TextStyle(fontSize: 20, color: ColorsTheme.blackColor),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight! / 20),
        InkWell(
          onTap: () => phoneBoutton(),
          child: Container(
            decoration: BoxDecoration(
              color: decorationColor,
              border: Border.all(color: borderColor, width: 3),
              borderRadius: BorderRadius.circular(30),
            ),
            width: widthContainer,
            height: heightContainer,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.call,
                  size: 30,
                  color: borderColor,
                ),
                Text(
                  'Phone',
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorsTheme.blackColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  emailBoutton() async {
    const email = 'letsg9826@gmail.com';
    Uri url = Uri(
        scheme: "mailto", path: email, queryParameters: {'subject': 'مرحبا'});
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    }
  }

  phoneBoutton() async {
    const urlPhone = 'tel: 0538938216';
    if (await canLaunch(urlPhone)) {
      await launch(urlPhone);
    }
  }
}
