import 'dart:convert';

import 'package:using_riverpod_todo_app/data/model/github_api.dart';
import 'package:using_riverpod_todo_app/data/model/github_profile.dart';
import 'package:using_riverpod_todo_app/data/source/account_service.dart';
import 'package:using_riverpod_todo_app/data/source/profile_service.dart';

class ProfileServiceImpl implements ProfileService {
  final AccountService _accountService;
  ProfileServiceImpl(this._accountService);
  final GithubApi _githubApi = GithubApi.create();

  @override
  Future<GithubProfile> getProfile() async {
    final githubId = await _accountService.getGithubId();
    print(githubId);
    return _githubApi.getProfile(githubId).then((response) {
      if (response.isSuccessful) {
        final profile = GithubProfile.fromJson(json.decode(response.body));
        return profile;
      } else {
        throw Exception('Failed to load profile');
      }
    });
  }
}
