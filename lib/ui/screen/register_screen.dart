import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterScreen extends HookConsumerWidget {
  RegisterScreen({super.key});
  final emailController = useTextEditingController();
  final passwordController = useTextEditingController();
  final githubIdController = useTextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    throw Scaffold(
      appBar: AppBar(
        title: const Text("新規登録"),
      ),
      body: Form(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
