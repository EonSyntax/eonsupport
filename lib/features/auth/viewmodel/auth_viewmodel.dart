import 'package:flutter/foundation.dart';
import 'package:eonsupport/shared/models/user_model.dart';

/// Represents the current authentication state.
enum AuthState { initial, loading, authenticated, unauthenticated, error }

/// ViewModel for authentication logic.
/// Manages login/logout operations and user state.
/// This is a placeholder that uses mocked data.
/// Native authentication will be integrated through platform channels later.
class AuthViewModel extends ChangeNotifier {
  AuthState _state = AuthState.initial;
  UserModel? _user;
  String? _errorMessage;

  // Getters
  AuthState get state => _state;

  UserModel? get user => _user;

  String? get errorMessage => _errorMessage;

  bool get isAuthenticated => _state == AuthState.authenticated;

  /// Attempt login with email and password.
  /// Currently uses mocked authentication.
  /// Demo credentials: abcd@test.com / password1
  /// Future: Will be replaced with native authentication via platform channels.
  Future<bool> login({required String email, required String password}) async {
    try {
      _state = AuthState.loading;
      _errorMessage = null;
      notifyListeners();

      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 800));

      // Basic validation (will be moved to service layer)
      if (email.isEmpty || password.isEmpty) {
        throw 'Email and password cannot be empty';
      }

      if (!email.contains('@')) {
        throw 'Invalid email format';
      }

      // Demo/temporary access - allow any login for testing
      // Remove this block when implementing real authentication
      _user = UserModel.mock(email: email, displayName: email.split('@')[0]);

      _state = AuthState.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      _state = AuthState.error;
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  /// Logout the current user.
  void logout() {
    _user = null;
    _state = AuthState.unauthenticated;
    _errorMessage = null;
    notifyListeners();
  }

  /// Clear any error messages (for UI cleanup).
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
