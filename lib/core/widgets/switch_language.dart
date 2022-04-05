import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/localization/loale_lang/app_long.dart';
import 'package:helpings_needlys/localization/t_key_v.dart';

class SwitchLanguageApp extends StatelessWidget {
  const SwitchLanguageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String localeAr = 'ar';
    String localeEn = 'en';

    return GetBuilder<AppLang>(
        init: AppLang(),
        builder: (c) {
          return DropdownButton(
              items: [
                DropdownMenuItem(
                    child: Text(TKeys().localeEnText), value: localeEn),
                DropdownMenuItem(
                  child: Text(TKeys().localeArText),
                  value: localeAr,
                )
              ],
              value: c.appLang,
              onChanged: (v) {
                c.changelang(type: v.toString());
                Get.updateLocale(Locale(v.toString()));
              });
        });
  }
}
