import "package:flutter/material.dart";

import "../config/themes/app_theme.dart";

class CircleSpinner extends StatelessWidget {
  final double size;
  const CircleSpinner({super.key, this.size = 100});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: AppTheme.transparent_color,
        valueColor: AlwaysStoppedAnimation<Color>(
          AppTheme.main_color_1,
        ),
      ),
    );
  }
}
