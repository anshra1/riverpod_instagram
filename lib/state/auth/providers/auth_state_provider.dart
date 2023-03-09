import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_instagram/state/auth/notifier/auth_state_notifier.dart';

import '../models/auth_state.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
    (_) => AuthStateNotifier());
