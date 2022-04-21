import 'package:flutter/material.dart';
import 'package:helpings_needlys/core/utils/colors.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/core/widgets/sigin_mathod.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';
import 'package:helpings_needlys/pages/log/login.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(TKeys().resetPassword),
      ),
      body: Center(
        child: SizedBox(
          height: SizeConfig.screenHeight! * .30,
          width: SizeConfig.screenWidth! / 1.1,
          child: Card(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: TKeys().email,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isNotEmpty) {
                      try {
                        resetPassword(email: emailController.text.trim())
                            .then((value) => {
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                            title: Center(
                                              child: SizedBox(
                                                  height:
                                                      SizeConfig.screenHeight! *
                                                          .19,
                                                  width:
                                                      SizeConfig.screenWidth! /
                                                          1.1,
                                                  child: Text(
                                                      TKeys().checkEmailSent)),
                                            ),
                                          )),
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (_) => const LogIn()),
                                        (route) => false);
                                  })
                                });
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text(TKeys().checkEmail),
                                ));
                      }
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text(TKeys().checkEmail),
                              ));
                    }
                  },
                  child: Text(TKeys().send),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ColorsTheme.darkPrimaryColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
