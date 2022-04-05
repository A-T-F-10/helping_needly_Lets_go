import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpings_needlys/localization/loale_lang/locale_storage.dart';

class AppLang extends GetxController {
  var appLang = 'ar';
  @override
  void onInit() async {
    super.onInit();
    LocaleStorage localeStorage = LocaleStorage();
    appLang = localeStorage.languageSelected == null
        ? 'en'
        : await localeStorage.languageSelected;

    Get.updateLocale(Locale(appLang.toString()));
    update();
  }

  changelang({String type = ''}) async {
    LocaleStorage localeStorage = LocaleStorage();
    if (appLang == type) {
      return;
    }
    if (type == 'en') {
      appLang = 'en';
      localeStorage.saveLang('en');
    } else {
      appLang = 'ar';
      localeStorage.saveLang('ar');
    }

    update();
  }
}
