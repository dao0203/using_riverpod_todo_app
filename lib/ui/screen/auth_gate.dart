import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod_todo_app/providers/auth_state_provider.dart';

import 'login_screen.dart';
import 'todo_list_screen.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate(Key? key) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authStateChangesProvider).when(
          data: (user) {
            if (user == null) {
              return const LoginScreen();
            } else {
              return const TodoListScreen();
            }
          },
          error: (e, s) => const Center(
            child: Text('Error'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
