import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:page_transition/page_transition.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/themes/app_theme.dart";
import "../../../shared/bounce_point.dart";
import "../../initial/views/initial_view.dart";
import "../controllers/splash_controller.dart";

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: const BouncePoint(size: 64),
        nextScreen: const InitialView(),
        curve: AppConstant.curve,
        backgroundColor: AppTheme.back_color_2,
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        animationDuration: AppConstant.duration,
        splashIconSize: double.infinity,
      ),
    );
  }
}
