import 'package:firebase_auth/firebase_auth.dart';
import 'package:using_riverpod_todo_app/data/source/account_service.dart';

import 'data_source_repository.dart';

class DataSourceRepositoryImpl extends DataSourceRepository {
  AccountService _accountService;
  DataSourceRepositoryImpl(this._accountService);
  @override
  User getUser() => _accountService.getUser();

  @override
  Future<bool> isSignedIn() {
    // TODO: implement isSignedIn
    throw UnimplementedError();
  }

  @override
  Future<String> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<String> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
  
}