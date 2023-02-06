
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_db/models/entity/result_entity/result_entity.dart';

part 'most_popular_movie_entity.g.dart';
@JsonSerializable()
class MostPopularMovieEntity {

  @JsonKey(name: 'page')
  final int? page;

  @JsonKey(name: 'results')
  final List<ResultEntity>? results;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @JsonKey(name: 'total_results')
  final int? totalResults;

  MostPopularMovieEntity(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory MostPopularMovieEntity.fromJson(Map<String,dynamic> json) => _$MostPopularMovieEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MostPopularMovieEntityToJson(this);


}