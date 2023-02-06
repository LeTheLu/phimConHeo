// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditsEntity _$CreditsEntityFromJson(Map<String, dynamic> json) =>
    CreditsEntity(
      id: json['id'] as int?,
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => CastEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => CastEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreditsEntityToJson(CreditsEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
