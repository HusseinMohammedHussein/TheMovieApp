// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonResult _$PersonResultFromJson(Map<String, dynamic> json) => PersonResult(
      json['id'] as int?,
      json['name'] as String?,
      json['profile_path'] as String?,
      json['gender'] as int?,
    );

Map<String, dynamic> _$PersonResultToJson(PersonResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'profile_path': instance.profilePath,
    };
