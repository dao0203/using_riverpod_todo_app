import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod_todo_app/providers.dart';
import 'package:using_riverpod_todo_app/ui/state/auth_notofier.dart';
import 'login_screen.dart';
import 'todo_list_screen.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate(Key? key) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authStateChangesProvider).when(
          data: (user) {
            if (user != null) {
              return const TodoListScreen();
            } else {
              return const LoginScreen();
            }
          },
          loading: () => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          error: (error, stackTrace) => Scaffold(
            body: Center(
              child: Text(error.toString()),
            ),
          ),
        );
  }
}
