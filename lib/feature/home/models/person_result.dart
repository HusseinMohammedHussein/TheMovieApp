import 'package:json_annotation/json_annotation.dart';

part 'person_result.g.dart';

@JsonSerializable()
class PersonResult {
  int? id;
  String? name;
  int? gender;
  @JsonKey(name: "profile_path")
  String? profilePath;

  PersonResult(this.id, this.name, this.profilePath, this.gender);

  factory PersonResult.fromJson(Map<String, dynamic> json) => _$PersonResultFromJson(json);

  Map<String, dynamic> toJson() => _$PersonResultToJson(this);


}