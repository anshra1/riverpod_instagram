import 'package:riverpod_instagram/state/auth/models/auth_result.dart';

import '../../posts/typdedefs/user_id.dart';

class AuthState {
  final AuthResult? result;
  final bool isLoading;
  final UserId? userId;

  const AuthState({
    required this.result,
    required this.isLoading,
    required this.userId,
  });

  const AuthState.unKnown()
      : result = null,
        isLoading = false,
        userId = null;

  AuthState copiedWithIsLoading(bool isLoading) {
    return AuthState(result: result, isLoading: isLoading, userId: userId);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthState &&
          runtimeType == other.runtimeType &&
          result == other.result &&
          isLoading == other.isLoading &&
          userId == other.userId;

  @override
  int get hashCode => result.hashCode ^ isLoading.hashCode ^ userId.hashCode;
}
