import 'package:chopper/chopper.dart';

part 'github_api.chopper.dart';

@ChopperApi(baseUrl: 'https://api.github.com')
abstract class GithubApi extends ChopperService {
  static GithubApi create() => _$GithubApi(ChopperClient());

  @Get(path: '/users/{username}')
  Future<Response> getProfile(@Path('username') String username);
}
