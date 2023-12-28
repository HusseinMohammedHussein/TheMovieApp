// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonProfile _$PersonProfileFromJson(Map<String, dynamic> json) =>
    PersonProfile(
      profiles: (json['profiles'] as List<dynamic>?)
          ?.map((e) => ProfileDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$PersonProfileToJson(PersonProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profiles': instance.profiles,
    };
