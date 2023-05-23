import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod_todo_app/providers/firebase_auth_provider.dart';

final authStateChangesProvider = StreamProvider(
  (ref) => ref.watch(firebaseAuthProvider).authStateChanges(),
);
