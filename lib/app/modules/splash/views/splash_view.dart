import 'package:flutter/material.dart';
import "package:animated_splash_screen/animated_splash_screen.dart";

import 'package:get/get.dart';
import "package:news_app/app/config/translations/app_translation.dart";

import '../../../config/constants/app_constant.dart';
import '../../../config/messages/app_message.dart';
import '../../../config/themes/app_theme.dart';
import '../../../shared/bounce_point.dart';
import '../../initial/views/initial_view.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: const Splash(),
        nextScreen: const InitialView(),
        curve: AppConstant.curve,
        backgroundColor: AppTheme.back_color_2,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: AppConstant.duration,
        splashIconSize: double.infinity,
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Expanded(
              //   child: Image.asset(
              //     AppMessage.app_logo,
              //     height: 512,
              //     width: 512,
              //   ),
              // ),
              ListTile(
                title: Text(
                  AppKeys.app_title.name.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.main_color_1,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                    fontSize: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Expanded(child: Center(child: BouncePoint(state: false))),
      ],
    );
  }
}
