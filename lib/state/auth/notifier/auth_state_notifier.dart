import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_instagram/state/auth/backend/authenticator.dart';
import 'package:riverpod_instagram/state/auth/models/auth_result.dart';
import 'package:riverpod_instagram/state/user_info/backend/user_info_storage.dart';

import '../../posts/typdedefs/user_id.dart';
import '../models/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = Authenticator();
  final _userInfoStorage = const UserInfoStorage();

  AuthStateNotifier() : super(const AuthState.unKnown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
        result: AuthResult.success,
        isLoading: false,
        userId: _authenticator.userId,
      );
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authenticator.logOut();
    state = const AuthState.unKnown();
  }

  Future<void> loginWithGoogle() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.loginWithGoogle();
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(userId: userId);
    }

    state = AuthState(
      result: result,
      isLoading: false,
      userId: userId,
    );
  }

  Future<void> saveUserInfo({required UserId userId}) async {
    _userInfoStorage.saveUserInfo(
        userId: userId,
        displyName: _authenticator.displyName,
        email: _authenticator.email);
  }
}
