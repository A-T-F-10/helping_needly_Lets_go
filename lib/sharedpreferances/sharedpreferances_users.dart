import 'package:helpings_needlys/sharedpreferances/keys_sharedpreferances.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models_sharedpreferances/model_sharedpreferances_signup1.dart';
import '../models/models_sharedpreferances/model_sharedpreferances_signup2.dart';

class SharedpreferancesSignup {
  String e = "";
  Future saveData(
      {SharedpreferancesSignup1? users1,
      SharedpreferancesSignup2? users2}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (users1 != null) {
      sharedPreferences.setString(
          KeysSharedpreferances.AGE, users1.age.toString());
      sharedPreferences.setString(
          KeysSharedpreferances.LOCATION, users1.location);
      sharedPreferences.setString(KeysSharedpreferances.TYPE, users1.type);
      sharedPreferences.setInt(KeysSharedpreferances.GENDER, users1.gender);
      sharedPreferences.setInt(
          KeysSharedpreferances.DISABILLITY, users1.disability);
    } else {
      sharedPreferences.setString(
          KeysSharedpreferances.USERNAME, users2!.userName.toString());
      sharedPreferences.setString(
          KeysSharedpreferances.EMAIL, users2.email.toString());
      sharedPreferences.setString(
          KeysSharedpreferances.PASSWORD, users2.password.toString());
    }
  }

  static Future getData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    dynamic data = sharedPreferences.get(key);
    return data;
  }
}
