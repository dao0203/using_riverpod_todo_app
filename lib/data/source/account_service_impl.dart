import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:using_riverpod_todo_app/providers/auth_state_provider.dart';

import 'account_service.dart';

class AccountSourceImpl extends AccountService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  AccountSourceImpl(this._auth, this._firestore);
  @override
  User getUser() => _auth.currentUser!;

  @override
  Stream<void> isSignedIn() => _auth.authStateChanges();

  @override
  Future<void> signIn(String email, String password) async {
    // TODO: implement signIn
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(
    String email,
    String password,
    String githubId,
  ) =>
      _auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => _firestore.collection('users').doc(value.user!.uid).set(
              {'githubId': githubId},
            ),
          );
}
