// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDetails _$PersonDetailsFromJson(Map<String, dynamic> json) =>
    PersonDetails(
      id: json['id'] as int?,
      name: json['name'] as String?,
      gender: json['gender'] as int?,
      profilePath: json['profile_path'] as String?,
    )..bioGraphy = json['biography'] as String?;

Map<String, dynamic> _$PersonDetailsToJson(PersonDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'biography': instance.bioGraphy,
      'gender': instance.gender,
      'profile_path': instance.profilePath,
    };
