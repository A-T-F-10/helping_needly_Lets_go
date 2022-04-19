import 'package:flutter/material.dart';

class ColorsTheme {
  static Color darkPrimaryColor = const Color(0xff03ae47);
  static Color primaryColor = const Color(0xff00cc51);
  static Color secondColor = const Color(0xFFD9D9D9);
  static Color lightPrimaryColor = const Color(0x0ffb2dfd);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color blackColor = const Color(0xFF212121);
  static Color sliderdColor = const Color.fromARGB(255, 121, 127, 129);
  static Color sliderdColor2 = const Color.fromARGB(255, 63, 72, 75);

  static ThemeData themeData = themeLight;

  static ThemeData themeLight = ThemeData.light().copyWith(
      sliderTheme: SliderThemeData(
        thumbColor: darkPrimaryColor,
        disabledThumbColor: sliderdColor2,
        activeTrackColor: primaryColor,
      ),
      primaryColorLight: primaryColor,
      primaryColorDark: darkPrimaryColor,
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(darkPrimaryColor),
        thumbColor: MaterialStateProperty.all(primaryColor),
      ),
      timePickerTheme: TimePickerThemeData(
          backgroundColor: darkPrimaryColor,
          dialBackgroundColor: darkPrimaryColor,
          inputDecorationTheme:
              InputDecorationTheme(fillColor: darkPrimaryColor)),
      scaffoldBackgroundColor: secondColor,
      appBarTheme: AppBarTheme(color: darkPrimaryColor),
      primaryColor: darkPrimaryColor);

////////////
  ///
  ///
  static ThemeData themeDark = ThemeData.dark().copyWith(
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(darkPrimaryColor),
        thumbColor: MaterialStateProperty.all(primaryColor),
      ),
      sliderTheme: SliderThemeData(
        thumbColor: darkPrimaryColor,
        disabledThumbColor: sliderdColor2,
        activeTrackColor: primaryColor,
      ),
      timePickerTheme: TimePickerThemeData(
          backgroundColor: blackColor,
          dialBackgroundColor: blackColor,
          inputDecorationTheme: InputDecorationTheme(fillColor: blackColor)),
      scaffoldBackgroundColor: blackColor,
      appBarTheme: AppBarTheme(color: darkPrimaryColor),
      primaryColor: blackColor);
///////////////
  ///
  ///
  static ThemeData theme = ThemeData.dark().copyWith(
      sliderTheme: SliderThemeData(
        thumbColor: darkPrimaryColor,
        disabledThumbColor: sliderdColor2,
        activeTrackColor: primaryColor,
      ),
      switchTheme: SwitchThemeData(
        overlayColor: MaterialStateProperty.all(darkPrimaryColor),
        thumbColor: MaterialStateProperty.all(primaryColor),
      ),
      timePickerTheme: TimePickerThemeData(
          backgroundColor: blackColor,
          dialBackgroundColor: sliderdColor2,
          inputDecorationTheme: InputDecorationTheme(fillColor: primaryColor)),
      scaffoldBackgroundColor: sliderdColor2,
      appBarTheme: AppBarTheme(color: darkPrimaryColor),
      primaryColor: primaryColor);
}
