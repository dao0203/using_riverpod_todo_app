import 'package:firebase_auth/firebase_auth.dart';

abstract class DataSourceRepository {
  //Firebase Authentification
  Future<void> signIn(String email, String password);
  Future<void> signUp(String email, String password, String githubId);
  Future<void> signOut();
  Stream<User?> isSignedIn();
  User getUser();
}
