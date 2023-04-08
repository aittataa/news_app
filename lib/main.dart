import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/app/modules/initial/views/initial_view.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";

import "app/config/enums/app_enum.dart";
import "app/config/functions/app_function.dart";
import "app/config/themes/app_theme.dart";
import "app/config/translations/app_translation.dart";
import "app/modules/splash/views/splash_view.dart";
import 'app/config/themes/app_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppFunction.configureDependencies;
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppKeys.app_title.name.tr,
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      transitionDuration: Duration.zero,
      defaultTransition: Transition.noTransition,
      smartManagement: SmartManagement.full,
      translations: AppTranslation(),
      locale: Locale(LanguagesCode.en.name),
      home: Builder(builder: (_) {
        return const InitialView();
      }),
    );
  }
}
