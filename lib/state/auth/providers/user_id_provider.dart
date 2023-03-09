import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_instagram/state/auth/providers/auth_state_provider.dart';

import '../../posts/typdedefs/user_id.dart';

final userIdProvider = Provider<UserId?>(
  (ref) => ref.watch(authStateProvider).userId,
);
