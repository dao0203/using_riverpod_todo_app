// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubProfile _$$_GithubProfileFromJson(Map<String, dynamic> json) =>
    _$_GithubProfile(
      bio: json['bio'] as String? ?? 'N/A',
      login: json['login'] as String? ?? 'N/A',
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? 'N/A',
      company: json['company'] as String? ?? 'N/A',
      location: json['location'] as String? ?? 'N/A',
      twitterUsername: json['twitter_username'] as String? ?? 'N/A',
      followers: json['followers'] as int? ?? -1,
      following: json['following'] as int? ?? -1,
    );

Map<String, dynamic> _$$_GithubProfileToJson(_$_GithubProfile instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'login': instance.login,
      'id': instance.id,
      'name': instance.name,
      'company': instance.company,
      'location': instance.location,
      'twitter_username': instance.twitterUsername,
      'followers': instance.followers,
      'following': instance.following,
    };
