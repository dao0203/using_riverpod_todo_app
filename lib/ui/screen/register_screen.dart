import 'package:firebase_auth/firebase_auth.dart';
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
    final errorText = useState('');
    void showErrorText(FirebaseAuthException error) {
      if (error.code == 'user-not-found') {
        errorText.value = 'ユーザーが見つかりませんでした';
      } else if (error.code == 'wrong-password') {
        errorText.value = 'パスワードが間違っています';
      } else if (error.code == 'network-request-failed') {
        errorText.value = 'ネットワークエラーが発生しました';
      } else {
        errorText.value = error.toString();
      }
    }

    return Scaffold(
      appBar: AppBar(
        //バックボタンにカラーをつける
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "新規登録",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: registerKey,
          child: Padding(
            padding: padding8,
            child: Column(
              children: [
                brank16,
                const Text("新規登録"),
                brank16,
                Text(
                  errorText.value,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
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
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  icon: Icon(Icons.login,
                      color: Theme.of(context).colorScheme.onPrimary),
                  label: Text(
                    "新規登録",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  onPressed: () async {
                    // バリデーションチェック
                    if (registerKey.currentState!.validate()) {
                      // インディケーターを表示
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                      // 登録処理
                      await ref
                          .read(authStateProvider.notifier)
                          .signUp(
                            emailController.text,
                            passwordController.text,
                            githubIdController.text,
                          )
                          .then(
                        (_) {
                          // 登録完了後、TodoList画面へ遷移
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            "todo_list",
                            (_) => false,
                          );
                        },
                      ).onError(
                        (FirebaseAuthException error, stackTrace) {
                          // エラー時の処理
                          showErrorText(error);
                          // インディケーターを非表示
                          Navigator.of(context).pop();
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
