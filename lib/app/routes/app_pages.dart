import "package:flutter/cupertino.dart";
import "package:get/get.dart";

import "../modules/initial/bindings/initial_binding.dart";
import "../modules/initial/views/initial_view.dart";
import "../modules/splash/bindings/splash_binding.dart";
import "../modules/splash/views/splash_view.dart";

part "app_routes.dart";

class AppPages {
  AppPages._();

  static const String initial = Routes.INITIAL;

  static final List<GetPage<Widget>> routes = <GetPage<Widget>>[
    GetPage<Widget>(
      name: _Paths.INITIAL,
      page: () => const InitialView(),
      binding: InitialBinding(),
    ),
    GetPage<Widget>(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
