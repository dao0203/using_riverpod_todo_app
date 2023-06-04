import 'package:firebase_auth/firebase_auth.dart';
import 'package:using_riverpod_todo_app/data/model/github_profile.dart';
import 'package:using_riverpod_todo_app/data/source/account_service.dart';
import 'package:using_riverpod_todo_app/data/source/profile_service.dart';

import 'data_source_repository.dart';

class DataSourceRepositoryImpl implements DataSourceRepository {
  final AccountService _accountService;
  final ProfileService _profileService;
  DataSourceRepositoryImpl(
    this._accountService,
    this._profileService,
  );

  @override
  User getUser() => _accountService.getUser();

  @override
  Stream<User?> isSignedIn() => _accountService.isSignedIn();

  @override
  Future<void> signIn(String email, String password) =>
      _accountService.signIn(email, password);

  @override
  Future<void> signOut() => _accountService.signOut();

  @override
  Future<void> signUp(String email, String password, String githubId) =>
      _accountService.signUp(email, password, githubId);

  @override
  Future<GithubProfile> getProfile(String githubId) {
    throw UnimplementedError();
  }
}
