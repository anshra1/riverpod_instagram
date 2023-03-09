import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_instagram/state/auth/providers/auth_state_provider.dart';
import 'dart:developer' as devtools show log;

import 'package:riverpod_instagram/state/auth/providers/is_logged_in_provider.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Consumer(
        builder: (BuildContext context, WidgetRef ref, child) {
          final isLoggedIn = ref.watch(isLoggedInProvider);
          if (isLoggedIn) {
            return const LogInView();
          } else {
            return const MainView();
          }
        },
      ),
    );
  }
}

class MainView extends ConsumerWidget {
  const MainView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
      ),
      body: Column(
        children: [
          Center(
              child: TextButton(
                  onPressed: () {
                    final result =
                        ref.read(authStateProvider.notifier).loginWithGoogle();
                    result.log();
                  },
                  child: const Text('sing In With Google')))
        ],
      ),
    );
  }
}

class LogInView extends ConsumerWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn View'),
      ),
      body: Column(
        children: [
          Center(
              child: TextButton(
                  onPressed: () {
                    final result =
                        ref.read(authStateProvider.notifier).logOut();
                    result.log();
                  },
                  child: const Text('Log Out')))
        ],
      ),
    );
  }
}
