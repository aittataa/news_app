import "package:flutter/material.dart";
import "package:get/get.dart";

import "../config/themes/app_theme.dart";
import "../modules/home/views/home_view.dart";

class IconBack extends StatelessWidget {
  const IconBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          Get.off(() => const HomeView());
        }
      },
      color: AppTheme.main_color_1,
      splashColor: AppTheme.main_color_1.withOpacity(.15),
      highlightColor: AppTheme.main_color_1.withOpacity(.25),
      icon: const Icon(
        Icons.arrow_back,
        color: AppTheme.main_color_1,
        size: 27.5,
      ),
    );
  }
}
