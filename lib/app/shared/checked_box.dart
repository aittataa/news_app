import "package:flutter/cupertino.dart";
import "package:get/get.dart";

import "../config/constants/app_constant.dart";
import "../config/themes/app_theme.dart";

class CheckedBox extends StatelessWidget {
  final double size;
  final bool state;
  final void Function()? onTap;
  const CheckedBox({
    super.key,
    this.size = 25,
    this.state = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: 25.milliseconds,
        curve: AppConstant.curve,
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.5),
          color: state ? AppTheme.main_color_1 : AppTheme.transparent_color,
          border: Border.all(width: 2.5, color: AppTheme.main_color_1),
        ),
        child: Icon(
          CupertinoIcons.checkmark_alt,
          color: state ? AppTheme.icon_color_2 : AppTheme.transparent_color,
          size: size * .75,
        ),
      ),
    );
  }
}
