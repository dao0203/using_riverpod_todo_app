abstract class DataSourceRepository {
  //Firebase Authentification
  Future<String> signIn(String email, String password);
  Future<String> signUp(String email, String password);
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String> getUser();
}
