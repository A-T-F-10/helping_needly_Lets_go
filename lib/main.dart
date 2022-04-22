import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/core/features/Splash/presentation/splash_view.dart';
import 'package:helpings_needlys/core/utils/colors.dart';
import 'package:helpings_needlys/core/widgets/massege.dart';
import 'package:helpings_needlys/core/widgets/sigin_mathod.dart';
import 'package:helpings_needlys/localization/loale_lang/translation.dart';
import 'package:helpings_needlys/sharedpreferances/modle_get_date.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ModleGetDate().gett();
  Messages().tokens();

  Future.delayed(const Duration(seconds: 2), () {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ThemeData? themeData;
  @override
  Widget build(BuildContext context) {
    setState(() {
      if (ModleGetDate.colors == 0.0) {
        themeData = ColorsTheme.themeLight;
      } else if (ModleGetDate.colors == 5.0) {
        themeData = ColorsTheme.theme;
      } else {
        themeData = ColorsTheme.themeDark;
      }
    });

    String locale = 'ar';
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      translations: Translation(),
      locale: Locale(locale),
      fallbackLocale: Locale(locale),
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: Utils.messengerKey,
      theme: themeData,
      home: const SplashView(),
    );
  }
}
