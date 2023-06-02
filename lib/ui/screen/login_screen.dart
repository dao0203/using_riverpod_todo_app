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
    final errorText = useState('');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Login',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
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
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () async {
                  if (loginKey.currentState!.validate()) {
                    // インディケーターを表示
                    showDialog(
                      context: context,
                      builder: (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
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
                        )
                        .onError((error, stackTrace) =>
                            errorText.value = error.toString());
                  }
                },
                icon: Icon(
                  Icons.login,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                label: Text(
                  'ログイン',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/login/register');
                },
                icon: Icon(
                  Icons.app_registration,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                label: Text(
                  '新規登録画面へ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
