// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubProfile _$$_GithubProfileFromJson(Map<String, dynamic> json) =>
    _$_GithubProfile(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      company: json['company'] as String? ?? '',
      location: json['location'] as String? ?? '',
      twitterUsername: json['twitter_username'] as String? ?? '',
      followers: json['followers'] as int? ?? 0,
      following: json['following'] as int? ?? 0,
      twitterId: json['twitter_id'] as String? ?? '',
    );

Map<String, dynamic> _$$_GithubProfileToJson(_$_GithubProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'company': instance.company,
      'location': instance.location,
      'twitter_username': instance.twitterUsername,
      'followers': instance.followers,
      'following': instance.following,
      'twitter_id': instance.twitterId,
    };
