import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod_todo_app/utils/const.dart';
import '../../providers.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final loginKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: loginKey,
        child: Padding(
          padding: padding8,
          child: Column(
            children: [
              brank16,
              const Text("ログイン"),
              brank16,
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'メールアドレスを入力してください';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                ),
                controller: emailController,
              ),
              brank8,
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'パスワードを入力してください';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Password',
                  icon: Icon(Icons.lock),
                ),
                controller: passwordController,
              ),
              brank8,
              ElevatedButton(
                onPressed: () async {
                  // インディケーターを表示
                  showDialog(
                    context: context,
                    builder: (_) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                  if (loginKey.currentState!.validate()) {
                    //新規登録処理
                    await ref
                        .read(firebaseAuthProvider)
                        .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        )
                        .then(
                          (_) => Navigator.of(context).pushNamedAndRemoveUntil(
                            '/todo_list',
                            (_) => false,
                          ),
                        );
                  }
                },
                child: const Text('Sign in'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (loginKey.currentState!.validate()) {
                    //新規登録処理
                    // await ref
                    //     .read(authStateProvider.notifier).signUp(email, password, githubId)
                    //     .then(
                    //       (_) => Navigator.of(context).pushNamedAndRemoveUntil(
                    //         '/todo_list',
                    //         (_) => false,
                    //       ),
                    //     );
                  }
                },
                child: const Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
