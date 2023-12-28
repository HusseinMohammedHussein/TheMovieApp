import 'package:flutter_themoviedb_assignment/feature/person_details/models/profile_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_profile.g.dart';

@JsonSerializable()
class PersonProfile {
  int? id;
  @JsonKey(name: "profiles")
  List<ProfileDetails>? profiles;

  PersonProfile({this.profiles, this.id});

  factory PersonProfile.fromJson(Map<String, dynamic> json) =>
      _$PersonProfileFromJson(json);

  Map<String, dynamic> toJson() => _$PersonProfileToJson(this);
}