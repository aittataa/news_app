import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../config/constants/app_constant.dart";
import "../config/themes/app_theme.dart";

class OutlineButton extends StatelessWidget {
  final String label;
  final Color backColor;
  final Color textColor;
  final void Function()? onPressed;

  const OutlineButton({
    super.key,
    required this.label,
    this.backColor = AppTheme.main_color_1,
    this.textColor = AppTheme.text_color_2,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        elevation: 0,
        // foregroundColor: backColor,
        backgroundColor: backColor,
        // disabledForegroundColor: backColor,
        // shadowColor: Colors.amber,
        // surfaceTintColor: backColor,
        shape: const RoundedRectangleBorder(
            borderRadius: AppConstant.borderRadius),
        minimumSize: const Size(double.infinity, 50),
        side: BorderSide.none,
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: textColor,
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
        ),
      ),
    );
  }
}
