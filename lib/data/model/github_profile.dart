import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_profile.freezed.dart';
part 'github_profile.g.dart';

@freezed
class GithubProfile with _$GithubProfile {
  const factory GithubProfile({
    @JsonKey(name: 'id', defaultValue: "N/A") required String id,
    @JsonKey(name: 'name', defaultValue: "N/A") required String name,
    @JsonKey(name: 'company', defaultValue: "N/A") required String company,
    @JsonKey(name: 'location', defaultValue: "N/A") required String location,
    @JsonKey(name: 'twitter_username', defaultValue: "N/A")
        required String twitterUsername,
    @JsonKey(name: 'followers', defaultValue: 0) required int followers,
    @JsonKey(name: 'following', defaultValue: 0) required int following,
    @JsonKey(name: 'twitter_id', defaultValue: "N/A") required String twitterId,
  }) = _GithubProfile;

  factory GithubProfile.fromJson(Map<String, dynamic> json) =>
      _$GithubProfileFromJson(json);
}
