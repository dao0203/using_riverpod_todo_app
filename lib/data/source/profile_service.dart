import '../model/github_profile.dart';

abstract class ProfileService {
  Future<GithubProfile> getProfile(String githubId);
}