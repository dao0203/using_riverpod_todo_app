import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repository/data_source_repository.dart';

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier(this._auth) : super(null) {
    _auth.getUser();
  }

  final DataSourceRepository _auth;

  User getUser() {
    return _auth.getUser();
  }

  Stream<User?> isSignedIn() {
    return _auth.isSignedIn();
  }

  Future<void> signIn(String email, String password) async {
    await _auth.signIn(email, password);
  }

  Future<void> signUp(String email, String password, String githubId) async {
    await _auth.signUp(email, password, githubId);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
