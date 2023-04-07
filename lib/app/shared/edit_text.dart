import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../config/constants/app_constant.dart";
import "../config/messages/app_message.dart";
import "../config/themes/app_theme.dart";

class EditText extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  // final List<TextInputFormatter> inputFormatters;
  final bool readOnly;
  final int maxLines;
  final Widget? trailing;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  const EditText({
    super.key,
    this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.maxLines = 1,
    this.trailing,
    this.validator,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      style: GoogleFonts.poppins(
        color: AppTheme.text_color_1.withOpacity(.75),
        fontWeight: FontWeight.bold,
        letterSpacing: .5,
        fontSize: 14,
      ),
      scrollPadding: EdgeInsets.zero,
      cursorColor: AppTheme.main_color_1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      // inputFormatters: inputFormatters,
      obscureText: obscureText,
      obscuringCharacter: AppMessage.obscuring_character,
      readOnly: readOnly,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: AppConstant.inputBorder,
        focusedBorder: AppConstant.inputBorder,
        enabledBorder: AppConstant.inputBorder,
        disabledBorder: AppConstant.inputBorder,
        focusedErrorBorder: AppConstant.inputBorder,
        errorBorder: AppConstant.inputBorder,
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: AppTheme.text_color_3,
          fontWeight: FontWeight.w500,
          letterSpacing: .5,
          fontSize: 12.5,
        ),
        filled: true,
        fillColor: AppTheme.back_color_2,
        errorStyle: GoogleFonts.poppins(
          color: AppTheme.red_color,
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
        ),
        suffixIcon: trailing,
      ),
      validator: validator,
    );
  }
}
