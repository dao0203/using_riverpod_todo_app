import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data/repository/data_source_repository.dart';
import 'data/repository/data_source_repository_impl.dart';
import 'data/source/account_service.dart';
import 'data/source/account_service_impl.dart';

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);
final authStateChangesProvider = StreamProvider(
  (ref) => ref.watch(firebaseAuthProvider).authStateChanges(),
);
final firebaseFirestoreProvider = Provider((ref) {
  return FirebaseFirestore.instance;
});
final accountServiceProvider = Provider<AccountService>((ref) {
  return AccountServiceImpl(ref.watch(firebaseAuthProvider), ref.watch(firebaseFirestoreProvider));
});
final dataSourceRepositoryProvider = Provider<DataSourceRepository>((ref) {
  return DataSourceRepositoryImpl(ref.watch(accountServiceProvider));
});