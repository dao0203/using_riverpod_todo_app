import 'package:chopper/chopper.dart';

part 'profile_service.chopper.dart';

@ChopperApi(baseUrl: 'https://api.github.com')
abstract class ProfileService extends ChopperService{
  static ProfileService create() => _$ProfileService(ChopperClient());

  @Get(path: '/users/{username}')
  Future<Response> getProfile(String username);
}