// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonPreview _$PersonPreviewFromJson(Map<String, dynamic> json) =>
    PersonPreview(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PersonResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonPreviewToJson(PersonPreview instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
