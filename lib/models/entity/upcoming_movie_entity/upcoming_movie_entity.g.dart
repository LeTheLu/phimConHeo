// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_movie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingMovieEntity _$UpcomingMovieEntityFromJson(Map<String, dynamic> json) =>
    UpcomingMovieEntity(
      dates: json['dates'] == null
          ? null
          : DatesEntity.fromJson(json['dates'] as Map<String, dynamic>),
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ResultEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$UpcomingMovieEntityToJson(
        UpcomingMovieEntity instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
