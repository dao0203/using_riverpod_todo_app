import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final key = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
              const SizedBox(height: 8.0),
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
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () async {
                  // インディケーターを表示
                  showDialog(
                    context: context,
                    builder: (_) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                  if (key.currentState!.validate()) {
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
                  if (key.currentState!.validate()) {
                    await ref
                        .read(firebaseAuthProvider)
                        .createUserWithEmailAndPassword(
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
                child: const Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
