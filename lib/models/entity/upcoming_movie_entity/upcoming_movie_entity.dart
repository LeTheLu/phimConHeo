
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_db/models/entity/dates_entity/dates_entity.dart';
import 'package:the_movie_db/models/entity/result_entity/result_entity.dart';

part 'upcoming_movie_entity.g.dart';
@JsonSerializable()
class UpcomingMovieEntity {
  @JsonKey(name: 'dates')
  final DatesEntity? dates;

  @JsonKey(name: 'page')
  final int? page;

  @JsonKey(name: 'results')
  final List<ResultEntity>? results;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @JsonKey(name: 'total_results')
  final int? totalResults;

  UpcomingMovieEntity(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults});

  factory UpcomingMovieEntity.fromJson(Map<String,dynamic> json) => _$UpcomingMovieEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UpcomingMovieEntityToJson(this);
}