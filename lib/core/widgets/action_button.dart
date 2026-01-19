import 'package:flutter/material.dart';

/// Small wrapper for action buttons to keep consistent sizing and style.
class ActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const ActionButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: FilledButton(onPressed: onPressed, child: child),
    );
  }
}
