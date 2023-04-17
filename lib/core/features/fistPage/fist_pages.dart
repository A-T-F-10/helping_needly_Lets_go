import 'package:flutter/material.dart';
import 'package:helpings_needlys/core/utils/colors.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';
import 'package:helpings_needlys/pages/log/login.dart';
import 'package:helpings_needlys/pages/volunteers/login_volunteer.dart';
import 'package:helpings_needlys/sharedpreferances/keys_sharedpreferances.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.whiteColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: SizeConfig.screenHeight! / 6,
                color: ColorsTheme.darkPrimaryColor,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            SizedBox(
              child: Image.asset('assets/images/Logo.png'),
            ),
            const Spacer(
              flex: 1,
            ),
            buttoms(
                text: 'دخول مستخدم',
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.setInt(KeysSharedpreferances.PAGE, 0);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (__) => const LogIn()),
                      (route) => true);
                }),
            buttoms(
                text: 'دخول متطوع',
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (__) => const VolunteersLogIn()),
                      (route) => true);
                }),
            const Spacer(
              flex: 2,
            ),
            ClipPath(
              clipper: WavyCircleClipper(3),
              child: Container(
                height: SizeConfig.screenHeight! / 6,
                color: ColorsTheme.darkPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttoms({required var onPressed, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 80,
        width: 300,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(ColorsTheme.primaryColor)),
        ),
      ),
    );
  }
}
