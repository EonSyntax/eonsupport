/// Application-wide constants and configuration.
class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // App identification
  static const String appName = 'EonSupport';
  static const String appVersion = '1.0.0';

  // Route names
  static const String routeLogin = '/login';
  static const String routeSignup = '/signup';
  static const String routeRoleSelection = '/role-selection';
  static const String routeControllerDashboard = '/controller-dashboard';
  static const String routeHostDashboard = '/host-dashboard';

  // Timeouts and delays
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration navigationTransition = Duration(milliseconds: 300);

  // UI spacing
  static const double paddingXSmall = 4.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  // Border radius
  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 12.0;
}
