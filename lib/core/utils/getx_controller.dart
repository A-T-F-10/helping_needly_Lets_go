import 'package:get/get.dart';
import 'package:helpings_needlys/core/utils/colors.dart';
import 'package:helpings_needlys/sharedpreferances/keys_sharedpreferances.dart';
import 'package:helpings_needlys/sharedpreferances/modle_get_date.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ChengegetxController extends GetxController {
  double valueColors = ModleGetDate.colors;

  bool chengeView = false;

  double valueSize = ModleGetDate.value;
  double sizex = ModleGetDate.size != 0.0 ? ModleGetDate.size : 2.0;

  double getSize = 1.5;
  double getValue = 0;

  void changerColor() {
    if (valueColors < 5) {
      Get.changeTheme(ColorsTheme.themeLight);
    } else if (valueColors == 5) {
      Get.changeTheme(ColorsTheme.theme);
    } else {
      Get.changeTheme(ColorsTheme.themeDark);
    }

    update();
  }

  void chengeViews() {
    chengeView = !chengeView;
    update();
  }

  void changerSize() {
    if (valueSize < 5) {
      sizex = 1.5;
      valueSize = 0;
    } else if (valueSize == 5) {
      sizex = 2.0;
      valueSize = 5;
    } else {
      sizex = 2.5;
      valueSize = 10;
    }
    update();
  }

  Future gett() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    getSize = preferences.getDouble(KeysSharedpreferances.SIZE)!;
    getValue = preferences.getDouble(KeysSharedpreferances.VALUE)!;
  }
}
