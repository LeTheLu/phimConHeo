import 'package:json_annotation/json_annotation.dart';

part 'belongs_to_collection_entity.g.dart';

@JsonSerializable()
class BelongsToCollectionEntity {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  String get posterUrl {
    return 'https://image.tmdb.org/t/p/w185${posterPath ?? ""}';
  }

  String get backdropUrl {
    return 'https://image.tmdb.org/t/p/w185${backdropPath ?? ""}';
  }


  BelongsToCollectionEntity(
      {this.id, this.name, this.posterPath, this.backdropPath});

  factory BelongsToCollectionEntity.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BelongsToCollectionEntityToJson(this);
}
