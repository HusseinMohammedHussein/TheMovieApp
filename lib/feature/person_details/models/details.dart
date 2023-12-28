import 'package:flutter_themoviedb_assignment/feature/person_details/models/profile_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details.g.dart';

@JsonSerializable()
class PersonDetails {
  int? id;
  String? name;
  @JsonKey(name: "biography")
  String? bioGraphy;
  int? gender; // 1 = Female, 2 = Male
  @JsonKey(name: "profile_path")
  String? profilePath;


  PersonDetails(
      {this.id, this.name, this.gender, this.profilePath});

  factory PersonDetails.fromJson(Map<String, dynamic> json) => _$PersonDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$PersonDetailsToJson(this);
}
