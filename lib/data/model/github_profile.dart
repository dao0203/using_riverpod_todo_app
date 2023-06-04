import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_profile.freezed.dart';
part 'github_profile.g.dart';

@freezed
class GithubProfile with _$GithubProfile {
  const factory GithubProfile({
    @JsonKey(name: 'login', defaultValue: "N/A") required String login,
    @JsonKey(name: 'id', defaultValue: -1) required int id,
    @JsonKey(name: 'name', defaultValue: "N/A") required String name,
    @JsonKey(name: 'company', defaultValue: "N/A") required String company,
    @JsonKey(name: 'location', defaultValue: "N/A") required String location,
    @JsonKey(name: 'twitter_username', defaultValue: "N/A")
        required String twitterUsername,
    @JsonKey(name: 'followers', defaultValue: -1) required int followers,
    @JsonKey(name: 'following', defaultValue: -1) required int following,
  }) = _GithubProfile;

  factory GithubProfile.fromJson(Map<String, dynamic> json) =>
      _$GithubProfileFromJson(json);
}
