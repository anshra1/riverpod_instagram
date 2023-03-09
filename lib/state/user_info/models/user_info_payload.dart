import 'dart:collection';

import '../../constants/firebase_field_name.dart';
import '../../posts/typdedefs/user_id.dart';

class UserInfoPayLoad extends MapView<String, String> {
  UserInfoPayLoad({
    required UserId userId,
    required String? displyName,
    required String? email,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.displyName: displyName ?? '',
          FirebaseFieldName.email: email ?? '',
        });
}
