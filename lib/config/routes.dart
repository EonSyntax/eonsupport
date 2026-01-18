import 'package:flutter/material.dart';
import 'package:eonsupport/core/constants/app_constants.dart';
import 'package:eonsupport/features/auth/presentation/screens/login_screen.dart';
import 'package:eonsupport/features/auth/presentation/screens/signup_screen.dart';
import 'package:eonsupport/features/role_selection/presentation/screens/role_selection_screen.dart';
import 'package:eonsupport/features/controller/presentation/screens/controller_dashboard_screen.dart';
import 'package:eonsupport/features/host/presentation/screens/host_dashboard_screen.dart';

/// Centralized navigation and route configuration.
/// Provides named routes for the entire application.
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstants.routeLogin:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );
      case AppConstants.routeSignup:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
          settings: settings,
        );
      case AppConstants.routeRoleSelection:
        return MaterialPageRoute(
          builder: (_) => const RoleSelectionScreen(),
          settings: settings,
        );
      case AppConstants.routeControllerDashboard:
        return MaterialPageRoute(
          builder: (_) => const ControllerDashboardScreen(),
          settings: settings,
        );
      case AppConstants.routeHostDashboard:
        return MaterialPageRoute(
          builder: (_) => const HostDashboardScreen(),
          settings: settings,
        );
      // Additional routes will be added here
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Unknown route: ${settings.name}')),
          ),
          settings: settings,
        );
    }
  }
}
