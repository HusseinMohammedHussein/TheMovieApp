import 'package:flutter_themoviedb_assignment/feature/home/models/person_result.dart';
import 'package:json_annotation/json_annotation.dart';


part 'person_preview.g.dart';

@JsonSerializable()
class PersonPreview {
  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "results")
  List<PersonResult>? results;

  PersonPreview({this.page, this.results});

  factory PersonPreview.fromJson(Map<String, dynamic> json) => _$PersonPreviewFromJson(json);

  Map<String, dynamic> foJson() => _$PersonPreviewToJson(this);



}