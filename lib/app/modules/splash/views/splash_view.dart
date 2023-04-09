import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:get/get.dart";
import "package:news_app/app/config/messages/app_message.dart";
import "package:news_app/app/shared/circle_spinner.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/themes/app_theme.dart";
import "../../initial/views/initial_view.dart";
import "../controllers/splash_controller.dart";

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: const Center(child: CircleSpinner(size: 64)),
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
          flex: 3,
          child: Center(
            child: SvgPicture.network(
              AppMessage.splash_screen_link,
              color: AppTheme.main_color_1,
              height: 250,
              width: 25,
            ),
          ),
        ),
        const Expanded(child: Center(child: CircleSpinner(size: 64))),
      ],
    );
  }
}
