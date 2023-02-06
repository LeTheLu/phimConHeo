// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'most_popular_movie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MostPopularMovieEntity _$MostPopularMovieEntityFromJson(
        Map<String, dynamic> json) =>
    MostPopularMovieEntity(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ResultEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$MostPopularMovieEntityToJson(
        MostPopularMovieEntity instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
