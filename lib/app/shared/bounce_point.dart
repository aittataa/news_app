import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

import "../config/constants/app_constant.dart";
import "../config/themes/app_theme.dart";

class BouncePoint extends StatelessWidget {
  final bool state;
  final double size;
  final Color? color;

  const BouncePoint({
    super.key,
    this.state = true,
    this.size = 64,
    this.color = AppTheme.main_color_1,
  });

  @override
  Widget build(BuildContext context) {
    if (state) {
      return SpinKitThreeBounce(
        size: size,
        color: color,
        duration: AppConstant.duration,
      );
    } else {
      return SpinKitSquareCircle(
        size: size,
        color: color,
        duration: AppConstant.duration,
      );
    }
  }
}
