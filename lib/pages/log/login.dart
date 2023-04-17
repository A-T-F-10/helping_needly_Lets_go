import 'package:flutter/material.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/core/widgets/sigin_mathod.dart';
import 'package:helpings_needlys/core/widgets/snack_bar.dart';
import 'package:helpings_needlys/core/widgets/text_form_field.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';
import 'package:helpings_needlys/pages/homepage.dart';
import 'package:helpings_needlys/pages/log/reset.dart';
import 'package:helpings_needlys/pages/log/sign_up.dart';
import 'package:helpings_needlys/sharedpreferances/keys_sharedpreferances.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/colors.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => LogInState();
}

class LogInState extends State<LogIn> {
  TextEditingController email = TextEditingController();
  TextEditingController passward = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        key: globalKey,
        backgroundColor: ColorsTheme.secondColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            TKeys().login,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/images/Logo.png',
                ),
                height: SizeConfig.screenHeight! / 2.5,
              ),
              SizedBox(height: SizeConfig.screenHeight! / 30),
              SizedBox(
                height: SizeConfig.screenHeight! * .11,
                width: SizeConfig.screenWidth! / 1.1,
                child: TextFormFieldItem(
                    // key: formkey,
                    labelText: TKeys().email,
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    errmess: "Please Fill email Input",
                    hintText: "Please enter your email "),
              ),

              SizedBox(
                height: SizeConfig.screenHeight! * .11,
                width: SizeConfig.screenWidth! / 1.1,
                child: TextFormFieldItem(
                    labelText: TKeys().password,
                    controller: passward,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    errmess: "Please Fill password Input",
                    hintText: "Please  enter your password "),
              ),
              button(
                  textButton: TKeys().login,
                  onPressed: () async {
                    if (email.text == null && email.text.isEmpty) {
                      // ignore: deprecated_member_use
                      globalKey.currentState?.showBottomSheet(
                          snackBar(text: TKeys().enterEmailAddress));

                      return;
                    } else {
                      try {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.setInt(KeysSharedpreferances.PAGE, 0);
                        preferences.setString(
                            KeysSharedpreferances.EMAIL, email.text.trim());
                        await signinWithEmailandPass(context,
                                email: email.text.trim(),
                                password: passward.text.trim())
                            .then((value) => Navigator.of(context)
                                .pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage()),
                                    (route) => false));
                      } catch (e) {
                        // ignore: deprecated_member_use
                        globalKey.currentState?.showBottomSheet(snackBar(
                            text:
                                'البريد الالكتروني او كلمة المرور غير صحيحة'));
                      }
                    }
                  }),
              // const SizedBox(height: 30),
              textAndButton(
                  text: 'هل نسيت كلمة المرور ؟',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ResetPassword()));
                  },
                  textButton: 'تغيير كلمة المرور'),
              textAndButton(
                  text: 'ليس لديك حساب ؟',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUp()));
                  },
                  textButton: TKeys().signUp),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  button({required String textButton, required Function() onPressed}) {
    return SizedBox(
        height: SizeConfig.screenHeight! / 14,
        width: SizeConfig.screenWidth! * 0.6,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(textButton),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(ColorsTheme.darkPrimaryColor)),
        ));
  }

  textAndButton(
      {required String? text,
      required Function()? onPressed,
      required String? textButton}) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        text!,
      ),
      TextButton(
          onPressed: onPressed,
          child: Text(textButton!,
              style: TextStyle(color: ColorsTheme.darkPrimaryColor)))
    ]);
  }
}
