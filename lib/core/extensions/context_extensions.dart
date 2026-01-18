import 'package:flutter/material.dart';

/// Convenient extensions on BuildContext.
extension ContextExtensions on BuildContext {
  /// Access theme colors easily
  Color get primaryColor => Theme.of(this).colorScheme.primary;

  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary;

  Color get surfaceColor => Theme.of(this).colorScheme.surface;

  Color get errorColor => Theme.of(this).colorScheme.error;

  /// Access MediaQuery without boilerplate
  Size get screenSize => MediaQuery.of(this).size;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  /// Check if device is in dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
