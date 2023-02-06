// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spoken_language_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpokenLanguageEntity _$SpokenLanguageEntityFromJson(
        Map<String, dynamic> json) =>
    SpokenLanguageEntity(
      englishName: json['english_name'] as String?,
      iso6391: json['iso_639_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpokenLanguageEntityToJson(
        SpokenLanguageEntity instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_639_1': instance.iso6391,
      'name': instance.name,
    };
