/// Represents an authenticated user in the application.
class UserModel {
  final String id;
  final String email;
  final String displayName;

  const UserModel({
    required this.id,
    required this.email,
    required this.displayName,
  });

  /// Factory constructor for mocked user creation
  factory UserModel.mock({
    String email = 'user@eonsupport.dev',
    String displayName = 'User',
  }) {
    return UserModel(
      id: 'mock_user_${DateTime.now().millisecondsSinceEpoch}',
      email: email,
      displayName: displayName,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, displayName: $displayName)';
  }
}
