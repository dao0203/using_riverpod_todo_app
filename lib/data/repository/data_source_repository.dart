import 'package:firebase_auth/firebase_auth.dart';

abstract class DataSourceRepository {
  //Firebase Authentification
  Future<String> signIn(String email, String password);
  Future<String> signUp(String email, String password);
  Future<void> signOut();
  Future<bool> isSignedIn();
  User getUser();
}
