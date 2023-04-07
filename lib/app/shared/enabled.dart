import "package:flutter/material.dart";

class Enabled extends StatelessWidget {
  final bool state;
  final Widget child;
  const Enabled({
    super.key,
    this.state = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: state,
      child: Opacity(
        opacity: state ? .75 : 1,
        child: child,
      ),
    );
  }
}
