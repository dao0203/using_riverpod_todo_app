
import 'package:using_riverpod_todo_app/data/model/github_profile.dart';
import 'package:using_riverpod_todo_app/data/source/profile_service.dart';

class ProfileServiceImpl implements ProfileService {
  @override
  Future<GithubProfile> getProfile(String githubId) {
    throw UnimplementedError();
  }
}