import "package:flutter/services.dart";
import "package:intl/intl.dart";

import "../themes/app_theme.dart";

class AppFunction {
  AppFunction._();

  static String dateFormat(DateTime date) => DateFormat("MMM dd, yyyy - HH:mm").format(date.toLocal());

  static get configureDependencies {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppTheme.transparent_color,
        systemNavigationBarDividerColor: AppTheme.transparent_color,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppTheme.transparent_color,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
}
