import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'account_service.dart';

class AccountServiceImpl extends AccountService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  AccountServiceImpl(this._auth, this._firestore);
  @override
  User getUser() => _auth.currentUser!;

  @override
  Stream<User?> isSignedIn() => _auth.authStateChanges();

  @override
  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() {
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
