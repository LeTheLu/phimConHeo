import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_db/models/entity/cast_entity/cast_entity.dart';

part 'credits_entity.g.dart';

@JsonSerializable()
class CreditsEntity {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'cast')
  final List<CastEntity>? cast;

  @JsonKey(name: 'crew')
  final List<CastEntity>? crew;

  CreditsEntity({this.id, this.cast, this.crew});

  factory CreditsEntity.fromJson(Map<String, dynamic> json) =>
      _$CreditsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsEntityToJson(this);
}
