import "package:flutter/material.dart";

import "../config/constants/app_constant.dart";

class ScrolledBar extends StatelessWidget {
  final ScrollController controller;
  final Widget child;
  const ScrolledBar({super.key, required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      thickness: 5,
      radius: const Radius.circular(AppConstant.radius),
      interactive: true,
      scrollbarOrientation: ScrollbarOrientation.right,
      child: child,
    );
  }
}
