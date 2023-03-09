import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_instagram/main.dart';
import 'package:riverpod_instagram/state/constants/firebase_field_name.dart';
import 'package:riverpod_instagram/state/posts/typdedefs/user_id.dart';
import 'dart:ui';

void main() {
  runApp(Test());
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);


  void test() {
    UserInfo userInfo =
        UserInfo(userId: 'userId', displyName: 'displyName', email: 'email');
    print(userInfo);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              test();
            },
            child: const Text('Text Button'),
          ),
        ),
      ),
    );
  }
}

class UserInfo extends MapView<String, String> {
  UserInfo({
    required UserId userId,
    required String? displyName,
    required String? email,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.displyName: displyName ?? '',
          FirebaseFieldName.email: email ?? '',
        });
}
