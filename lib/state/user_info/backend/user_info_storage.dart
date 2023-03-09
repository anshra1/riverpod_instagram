import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:riverpod_instagram/state/constants/firebase_collection_name.dart';
import 'package:riverpod_instagram/state/user_info/models/user_info_payload.dart';

import '../../constants/firebase_field_name.dart';
import '../../posts/typdedefs/user_id.dart';

class UserInfoStorage {
  const UserInfoStorage();

  Future<bool> saveUserInfo({
    required UserId userId,
    required String displyName,
    required String? email,
  }) async {
    try {
      // first  check if we have this user's info from before

      final userInfo = await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .where(FirebaseFieldName.userId, isEqualTo: userId)
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        await userInfo.docs.first.reference.update({
          FirebaseFieldName.displyName: displyName,
          FirebaseFieldName.email: email ?? '',
        });
        return true;
      }

      // we don't have this user's info from before , create new user

      final payLoad =
          UserInfoPayLoad(userId: userId, displyName: displyName, email: email);
      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .add(payLoad);
      return true;
    } catch (e) {
      return false;
    }
  }
}
