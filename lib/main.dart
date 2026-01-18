import 'package:flutter/material.dart';
import 'package:eonsupport/core/theme/app_theme.dart';
import 'package:eonsupport/core/constants/app_constants.dart';
import 'package:eonsupport/config/routes.dart';

void main() {
  runApp(const EonSupportApp());
}

/// Root widget for the EonSupport application.
/// Configures theming, routing, and core app settings.
class EonSupportApp extends StatelessWidget {
  const EonSupportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppConstants.routeLogin,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
