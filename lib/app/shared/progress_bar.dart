import "package:flutter/material.dart";
import "package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart";

import "../config/themes/app_theme.dart";
import "circle_spinner.dart";

class ProgressBar extends StatelessWidget {
  final bool anAsyncCall;
  final Widget child;
  const ProgressBar({
    super.key,
    this.anAsyncCall = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: anAsyncCall,
      opacity: .5,
      progressIndicator: const CircleSpinner(),
      color: AppTheme.main_color_1.withOpacity(.25),
      child: child,
    );
  }
}
