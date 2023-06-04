
import 'package:using_riverpod_todo_app/data/model/github_profile.dart';

abstract class ProfileService {
  Future<GithubProfile> getProfile();
}