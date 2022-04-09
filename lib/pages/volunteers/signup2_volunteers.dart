import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helpings_needlys/chats/key_uesr.dart';
import 'package:helpings_needlys/chats/models/motheds_chats.dart';
import 'package:helpings_needlys/core/utils/colors.dart';
import 'package:helpings_needlys/core/utils/size_confg.dart';
import 'package:helpings_needlys/core/widgets/sigin_mathod.dart';
import 'package:helpings_needlys/core/widgets/snack_bar.dart';
import 'package:helpings_needlys/core/widgets/text_form_field.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';
import 'package:helpings_needlys/pages/log/login.dart';
import 'package:helpings_needlys/pages/volunteers/login_volunteer.dart';
import 'package:helpings_needlys/sharedpreferances/keys_sharedpreferances.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../sharedpreferances/sharedpreferances_users.dart';
import '../../models/models_sharedpreferances/model_sharedpreferances_signup1.dart';

class VolunteersSignUp2 extends StatefulWidget {
  const VolunteersSignUp2({Key? key}) : super(key: key);

  @override
  State<VolunteersSignUp2> createState() => VolunteersSignUp2State();
}

class VolunteersSignUp2State extends State<VolunteersSignUp2> {
  SharedpreferancesSignup1 users = SharedpreferancesSignup1();

  LogInState logIn = LogInState();
  DateTime dateTime = DateTime.now();

  TextEditingController type = TextEditingController();
  TextEditingController locationUser = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    late String email;
    SharedpreferancesSignup.getData(KeysSharedpreferances.EMAIL)
        .then((value) => email = value);
    late String password;
    SharedpreferancesSignup.getData(KeysSharedpreferances.PASSWORD)
        .then((value) => password = value);
    late String userName;
    SharedpreferancesSignup.getData(KeysSharedpreferances.USERNAME)
        .then((value) => userName = value);

    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        backgroundColor: ColorsTheme.darkPrimaryColor,
        title: Text(
          TKeys().signUp,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: SizeConfig.screenHeight! / 10,
          ),
          text(text: TKeys().dateOfBirth),
          SizedBox(
            height: SizeConfig.screenHeight! / 40,
          ),
          date(
              day: dateTime.day.toString(),
              month: dateTime.month.toString(),
              years: dateTime.year.toString(),
              onTap: showDate),
          sizedBox(),
          SizedBox(
            width: SizeConfig.screenWidth! / 1.2,
            child: TextFormFieldItem(
                labelText: TKeys().phoneNumber,
                controller: type,
                keyboardType: TextInputType.number,
                errmess: TKeys().isNotEmpty,
                hintText: TKeys().type),
          ),
          sizedBox(),
          text(text: TKeys().gender),
          sizedBox(),
          bigSwitch(
              text1: TKeys().male,
              text2: TKeys().female,
              onToggle: (i) {
                users.gender = i!;
              }),
          sizedBox(),
          text(text: 'Location'),
          sizedBox(),
          location(
            controller: locationUser,
            icon: const Icon(Icons.search),
          ),
          sizedBox(),
          logIn.button(
              textButton: TKeys().save,
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.setInt(KeysSharedpreferances.PAGE, 1);
                createstVolunteer(
                    idCconterVolunteer: 0,
                    collectionVolunteer: keyUserAll,
                    documentVolunteer: userName + email,
                    volunteerEmail: email,
                    volunteerGender: users.gender,
                    volunteerName: userName,
                    volunteerPhone: type.text,
                    idChatVolunteer: 0);
                users.type = type.text;
                users.location = locationUser.text;
                SharedpreferancesSignup().saveData(users1: users);

                try {
                  print(email);
                  if (email.isEmpty) {
                    // ignore: deprecated_member_use
                    globalKey.currentState?.showSnackBar(
                        snackBar(text: TKeys().enterEmailAddress));
                    return;
                  } else {
                    await createnWithEmailandPass(context,
                        email: email.trim(), password: password);

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const VolunteersLogIn()),
                        (route) => true);
                  }
                } on FirebaseAuthException catch (e) {
                  Utils.showSnackBar(e.message);
                }
              }),
          sizedBox(),
        ]),
      ),
    );
  }

  text({required String text}) {
    return SizedBox(
      width: SizeConfig.screenWidth! / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  date(
      {required String day,
      required String month,
      required String years,
      Function()? onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: SizeConfig.screenWidth! * 0.41,
          height: SizeConfig.screenHeight! / 13,
          decoration: BoxDecoration(
            color: ColorsTheme.secondColor,
            boxShadow: [
              BoxShadow(
                color: ColorsTheme.secondColor,
                blurRadius: 10,
              ),
              //BoxShadow()
            ],
          ),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dateOfBirth(date: day),
                dateOfBirth(date: month),
                dateOfBirth(date: years),
              ],
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth! / 5,
        ),
      ],
    );
  }

  showDate() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
    ).then((value) => setState(() {
          if (value != null) {
            dateTime = value;
            users.age = dateTime;
          } else {
            dateTime = DateTime.now();
            users.age = dateTime;
          }
        }));
  }

  bigSwitch(
      {required String text1,
      required String text2,
      required Function(int?)? onToggle}) {
    return ToggleSwitch(
      totalSwitches: 2,
      labels: [text1, text2],
      minHeight: SizeConfig.screenHeight! / 10.9,
      minWidth: SizeConfig.screenWidth! / 3,
      cornerRadius: 5,
      onToggle: onToggle,
    );
  }

  location({
    required TextEditingController controller,
    required Icon icon,
  }) {
    return SizedBox(
        width: SizeConfig.screenWidth! / 1.2,
        child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: icon,
              labelStyle: TextStyle(color: ColorsTheme.darkPrimaryColor),
              focusColor: ColorsTheme.darkPrimaryColor,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsTheme.darkPrimaryColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsTheme.darkPrimaryColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            )));
  }
}

Widget dateOfBirth({required String date}) {
  return Container(
    color: Colors.white,
    width: SizeConfig.screenWidth! / 7.5,
    height: SizeConfig.screenHeight! / 10,
    // ignore: prefer_const_constructors
    child: Center(child: Text(date)),
  );
}

Widget sizedBox() {
  return SizedBox(
    height: SizeConfig.screenHeight! / 40,
  );
}
