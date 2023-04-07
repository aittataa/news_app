import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../config/constants/app_constant.dart";
import "../config/themes/app_theme.dart";

class DialogBox extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> actions;

  const DialogBox({
    super.key,
    required this.title,
    required this.subtitle,
    this.actions = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      buttonPadding: EdgeInsets.zero,
      backgroundColor: AppTheme.back_color_2,
      shape: const RoundedRectangleBorder(borderRadius: AppConstant.borderRadius),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: AppTheme.main_color_1,
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
        ),
      ),
      content: Text(
        subtitle,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: AppTheme.text_color_3,
          fontWeight: FontWeight.w500,
          letterSpacing: .5,
        ),
      ),
      actions: <Widget>[Row(children: actions)],
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final void Function()? onTap;
  const ActionButton({
    super.key,
    required this.label,
    this.color = AppTheme.main_color_1,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: AppTheme.border_color.withOpacity(.25), width: 1),
              left: BorderSide(color: AppTheme.border_color.withOpacity(.25), width: .5),
              right: BorderSide(color: AppTheme.border_color.withOpacity(.25), width: .5),
            ),
          ),
          child: FittedBox(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: color,
                fontWeight: FontWeight.bold,
                letterSpacing: .5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
