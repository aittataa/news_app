import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../config/themes/app_theme.dart";

class EmptyBox extends StatelessWidget {
  final String label;
  const EmptyBox({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: AppTheme.text_color_3,
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
          fontSize: 15,
        ),
      ),
    );
  }
}
