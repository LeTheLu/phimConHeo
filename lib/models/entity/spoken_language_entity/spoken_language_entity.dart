import 'package:json_annotation/json_annotation.dart';

part 'spoken_language_entity.g.dart';
@JsonSerializable()
class SpokenLanguageEntity {
  @JsonKey(name: 'english_name')
  final String? englishName;

  @JsonKey(name: 'iso_639_1')
  final String? iso6391;

  @JsonKey(name: 'name')
  final String? name;

  SpokenLanguageEntity({this.englishName, this.iso6391, this.name});

  factory SpokenLanguageEntity.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageEntityToJson(this);
}
