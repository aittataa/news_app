import 'package:flutter/services.dart';

import '../themes/app_theme.dart';

class AppFunction {
  AppFunction._();

  static get configureDependencies {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppTheme.transparent_color,
        systemNavigationBarDividerColor: AppTheme.main_color_1,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: AppTheme.transparent_color,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
}
