import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod_todo_app/data/source/profile_service.dart';
import 'package:using_riverpod_todo_app/data/source/profile_service_impl.dart';
import 'package:using_riverpod_todo_app/ui/state/auth_notofier.dart';

import 'data/model/github_profile.dart';
import 'data/repository/data_source_repository.dart';
import 'data/repository/data_source_repository_impl.dart';
import 'data/source/account_service.dart';
import 'data/source/account_service_impl.dart';

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);
final firebaseFirestoreProvider = Provider((ref) {
  return FirebaseFirestore.instance;
});

//DataSource
final accountServiceProvider = Provider<AccountService>((ref) {
  return AccountServiceImpl(
      ref.watch(firebaseAuthProvider), ref.watch(firebaseFirestoreProvider));
});

final profileServiceProvider = Provider<ProfileService>((ref) {
  return ProfileServiceImpl(ref.watch(accountServiceProvider));
});

//Repository
final dataSourceRepositoryProvider = Provider<DataSourceRepository>((ref) {
  return DataSourceRepositoryImpl(
    ref.watch(accountServiceProvider),
    ref.watch(profileServiceProvider),
  );
});

final profileProvider = FutureProvider<GithubProfile>((ref) async {
  return await ref.watch(dataSourceRepositoryProvider).getProfile();
});

//状態管理
final authStateProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier(ref.watch(dataSourceRepositoryProvider));
});

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.watch(authStateProvider.notifier).isSignedIn();
});
