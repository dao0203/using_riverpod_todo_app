import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:using_riverpod_todo_app/data/model/github_profile.dart';
import 'package:using_riverpod_todo_app/data/source/account_service.dart';
import 'package:using_riverpod_todo_app/data/source/profile_service.dart';

import 'data_source_repository.dart';

class DataSourceRepositoryImpl implements DataSourceRepository {
  final AccountService _accountService;
  DataSourceRepositoryImpl(
    this._accountService,
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
  Future<GithubProfile> getProfile() async {
    final githubId = await _accountService.getGithubId();
    return ProfileService.create().getProfile(githubId).then(
      (response) {
        if (response.isSuccessful) {
          //成功時にすべての型をString型で返す
          final profile = //bodyStringを使用するとエラーが発生する
              GithubProfile.fromJson(json.decode(response.body));
          return profile;
        } else {
          throw Exception('Failed to load profile');
        }
      },
    );
  }
}
