import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod_todo_app/providers.dart';
import '../../utils/const.dart';

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final githubIdController = useTextEditingController();
    final registerKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("新規登録"),
      ),
      body: Form(
        key: registerKey,
        child: Padding(
          padding: padding8,
          child: Column(
            children: [
              brank16,
              const Text("新規登録"),
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
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'パスワードを入力してください';
                  } else if (value != passwordController.text) {
                    return 'パスワードが一致しません';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Password(確認用)',
                  icon: Icon(Icons.lock),
                ),
                controller: confirmPasswordController,
              ),
              brank8,
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Github IDを入力してください';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Github ID',
                  icon: Icon(Icons.lock),
                ),
                controller: githubIdController,
              ),
              brank8,
              ElevatedButton(
                onPressed: () async {
                  // インディケーターを表示
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                  // バリデーションチェック
                  if (registerKey.currentState!.validate()) {
                    // 登録処理
                    await ref
                        .read(authStateProvider.notifier)
                        .signUp(
                          emailController.text,
                          passwordController.text,
                          githubIdController.text,
                        )
                        .then((_) {
                      // 登録完了後、ログイン画面に戻る
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        "todo_list",
                        (_) => false,
                      );
                    });
                  }
                },
                child: const Text("登録"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
