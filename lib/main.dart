import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod_todo_app/firebase_options.dart';
import 'package:using_riverpod_todo_app/ui/screen/auth_gate.dart';
import 'package:using_riverpod_todo_app/ui/screen/login_screen.dart';
import 'package:using_riverpod_todo_app/ui/screen/register_screen.dart';
import 'package:using_riverpod_todo_app/ui/screen/todo_list_screen.dart';
import 'package:using_riverpod_todo_app/ui/theme/color_schemes.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginScreen(),
        '/login/register': (context) => const RegisterScreen(),
        '/todo_list': (context) => const TodoListScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const AuthGate(null),
    );
  }
}
