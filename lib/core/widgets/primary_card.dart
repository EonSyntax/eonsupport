import 'package:flutter/material.dart';

/// Reusable primary card used across the app for consistent appearance.
/// Keeps UI consistent and centralizes InkWell behavior and padding.
class PrimaryCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double? elevation;

  const PrimaryCard({
    super.key,
    required this.child,
    this.onTap,
    this.elevation = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(padding: const EdgeInsets.all(16.0), child: child),
      ),
    );
  }
}
