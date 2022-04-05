import 'package:flutter/material.dart';

class ColorsTheme {
  static Color darkPrimaryColor = Color(0xFF00796B);
  static Color primaryColor = Color(0xFF009688);
  static Color secondColor = Color(0xFFD9D9D9);
  static Color lightPrimaryColor = Color(0xFFB2DFD);
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color blackColor = Color(0xFF212121);
  static Color sliderdColor = Color.fromARGB(255, 121, 127, 129);
  static Color sliderdColor2 = Color.fromARGB(255, 63, 72, 75);

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
