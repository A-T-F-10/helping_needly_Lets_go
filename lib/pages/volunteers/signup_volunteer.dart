import 'package:flutter/material.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/core/widgets/text_form_field.dart';
import 'package:helpings_needlys/pages/log/login.dart';
import 'package:helpings_needlys/pages/volunteers/signup2_volunteers.dart';

import '../../core/utils/colors.dart';
import '../../localization/t_key_v.dart';
import '../../sharedpreferances/sharedpreferances_users.dart';
import '../../models/models_sharedpreferances/model_sharedpreferances_signup1.dart';
import '../../models/models_sharedpreferances/model_sharedpreferances_signup2.dart';

class VolunteersSignUp extends StatefulWidget {
  const VolunteersSignUp({Key? key}) : super(key: key);

  @override
  State<VolunteersSignUp> createState() => VolunteersSignUpState();
}

class VolunteersSignUpState extends State<VolunteersSignUp> {
  SharedpreferancesSignup2 users2 = SharedpreferancesSignup2();

  LogInState logIn = LogInState();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  SharedpreferancesSignup1 users = SharedpreferancesSignup1();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsTheme.darkPrimaryColor,
        title: Text(
          TKeys().signUp,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! / 20,
            vertical: SizeConfig.screenHeight! * .01),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            child: Image.asset(
              'assets/images/Logo.png',
            ),
            height: SizeConfig.screenHeight! * .30,
          ),
          SizedBox(height: SizeConfig.screenHeight! / 20),
          SizedBox(
            width: SizeConfig.screenWidth! / 1.1,
            child: TextFormFieldItem(
                labelText: TKeys().userName,
                controller: username,
                keyboardType: TextInputType.name,
                errmess: TKeys().isNotEmpty,
                hintText: TKeys().userNameHint),
          ),
          SizedBox(height: SizeConfig.screenHeight! / 20),
          SizedBox(
              width: SizeConfig.screenWidth! / 1.1,
              child: TextFormFieldItem(
                labelText: TKeys().email,
                controller: email,
                keyboardType: TextInputType.emailAddress,
                errmess: "Please Fill email Input",
                hintText: TKeys().enterEmailAddress,
              )),
          SizedBox(height: SizeConfig.screenHeight! / 20),
          SizedBox(
            width: SizeConfig.screenWidth! / 1.1,
            child: TextFormFieldItem(
                labelText: TKeys().password,
                controller: password,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                errmess: TKeys().invalidPassword,
                hintText: TKeys().passwordHint),
          ),
          SizedBox(height: SizeConfig.screenHeight! / 20),
          SizedBox(
              width: SizeConfig.screenWidth! / 1.1,
              child: TextFormFieldItem(
                  labelText: TKeys().password,
                  controller: confirmPassword,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  errmess: TKeys().invalidPassword,
                  hintText: TKeys().passwordHint)),
          SizedBox(height: SizeConfig.screenHeight! / 20),
          logIn.button(
              textButton: TKeys().next,
              onPressed: () {
                if (password.text == confirmPassword.text &&
                    password.text.length >= 6) {
                  users2.email = email.text;
                  users2.userName = username.text;
                  users2.password = password.text;
                  SharedpreferancesSignup().saveData(users2: users2);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const VolunteersSignUp2()));
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(TKeys().passwordHint),
                          content: Text(TKeys().invalidPassword),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text(TKeys().ok),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      });
                }
              }),
          SizedBox(height: SizeConfig.screenHeight! / 20),
        ]),
      ),
    ));
  }
}
