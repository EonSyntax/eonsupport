import 'package:flutter/foundation.dart';
import 'package:eonsupport/shared/models/user_model.dart';

/// Represents the current signup state.
enum SignupState { initial, loading, success, error }

/// ViewModel for signup logic.
/// Manages user registration and account creation.
/// This is a placeholder that uses mocked data.
/// Native authentication will be integrated through platform channels later.
class SignupViewModel extends ChangeNotifier {
  SignupState _state = SignupState.initial;
  UserModel? _user;
  String? _errorMessage;

  // Getters
  SignupState get state => _state;

  UserModel? get user => _user;

  String? get errorMessage => _errorMessage;

  bool get isLoading => _state == SignupState.loading;

  /// Attempt to create a new account.
  /// Currently uses mocked signup.
  /// Future: Will be replaced with native authentication via platform channels.
  Future<bool> signup({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      _state = SignupState.loading;
      _errorMessage = null;
      notifyListeners();

      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 800));

      // Basic validation (will be moved to service layer)
      if (email.isEmpty || password.isEmpty || displayName.isEmpty) {
        throw 'All fields are required';
      }

      if (!email.contains('@')) {
        throw 'Invalid email format';
      }

      if (password.length < 6) {
        throw 'Password must be at least 6 characters';
      }

      if (displayName.length < 2) {
        throw 'Display name must be at least 2 characters';
      }

      // Mocked signup success
      _user = UserModel(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        email: email,
        displayName: displayName,
      );

      _state = SignupState.success;
      notifyListeners();
      return true;
    } catch (e) {
      _state = SignupState.error;
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  /// Clear any error messages (for UI cleanup).
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  /// Reset state (useful when navigating away).
  void reset() {
    _state = SignupState.initial;
    _user = null;
    _errorMessage = null;
    notifyListeners();
  }
}
