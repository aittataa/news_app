// ignore_for_file: constant_identifier_names

import "package:flutter/material.dart";

class AppTheme {
  AppTheme._();

  static const Color transparent_color = Color(0x00000000);
  static const Color shadow_color = Color(0xFF252525);
  static const Color border_color = Color(0xFF252525);
  static const Color green_color = Color(0xff08ff00);
  static const Color red_color = Color(0xfffd0000);

  /// TODO : Main colors
  static const Color main_color_1 = Color.fromARGB(255, 37, 76, 149);

  /// TODO : Backs
  static const Color back_color_1 = Color(0xFF252525);
  static const Color back_color_2 = Color(0xFFFFFFFF);
  static const Color back_color_3 = Color(0xFFA0A0A0);
  static const Color back_color_4 = Color(0xFFF0F0F0);

  /// TODO : Texts
  static const Color text_color_1 = Color(0xFF252525);
  static const Color text_color_2 = Color(0xFFFFFFFF);
  static const Color text_color_3 = Color(0xFFA9A9A9);

  /// TODO : Icons
  static const Color icon_color_1 = Color(0xFF252525);
  static const Color icon_color_2 = Color(0xFFFFFFFF);
  static const Color icon_color_3 = Color(0xFFA9A9A9);

  static ThemeData get light {
    return ThemeData(
      scaffoldBackgroundColor: back_color_2,
      primaryColor: transparent_color,
      splashColor: transparent_color,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: main_color_1,
        titleTextStyle: TextStyle(
          color: AppTheme.text_color_2,
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
          fontSize: 20,
        ),
      ),
    );
  }
}
