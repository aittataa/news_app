import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/themes/app_theme.dart";
import "../../../config/translations/app_translation.dart";

class SearchText extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  const SearchText({
    super.key,
    this.controller,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      style: GoogleFonts.poppins(
        color: AppTheme.text_color_2,
        fontWeight: FontWeight.bold,
        letterSpacing: .5,
      ),
      autofocus: true,
      autocorrect: true,
      scrollPadding: EdgeInsets.zero,
      cursorColor: AppTheme.text_color_2,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: const OutlineInputBorder(
          borderRadius: AppConstant.borderRadius,
          borderSide: BorderSide.none,
        ),
        hintText: AppKeys.labelSearch.name.tr,
        filled: true,
        fillColor: AppTheme.back_color_3,
        hintStyle: GoogleFonts.poppins(
          color: AppTheme.text_color_2.withOpacity(.75),
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
        ),
        errorStyle: GoogleFonts.poppins(
          color: AppTheme.red_color,
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
        ),
      ),
    );
  }
}
