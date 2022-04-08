import 'package:helpings_needlys/sharedpreferances/keys_sharedpreferances.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModleGetDate {
  String? themeData;
  static double size = 0.0;
  static double value = 0.0;
  static double colors = 0.0;
  static String email = '';
  static String username = '';
  static String password = '';
  static int gernder = 0;
  static String age = '';
  static int pagechenge = 0;

  Future gett() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    pagechenge = preferences.getInt(KeysSharedpreferances.PAGE)!;
    email = preferences.getString(KeysSharedpreferances.EMAIL)!;
    username = preferences.getString(KeysSharedpreferances.USERNAME)!;
    password = preferences.getString(KeysSharedpreferances.PASSWORD)!;
    size = preferences.getDouble(KeysSharedpreferances.SIZE)!;
    colors = preferences.getDouble(KeysSharedpreferances.THEME)!;
    value = preferences.getDouble(KeysSharedpreferances.VALUE)!;
    gernder = preferences.getInt(KeysSharedpreferances.GENDER)!;
    age = preferences.getString(KeysSharedpreferances.AGE)!;
  }
}
