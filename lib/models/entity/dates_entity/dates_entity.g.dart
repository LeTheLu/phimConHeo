// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dates_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatesEntity _$DatesEntityFromJson(Map<String, dynamic> json) => DatesEntity(
      maximum: json['maximum'] == null
          ? null
          : DateTime.parse(json['maximum'] as String),
      minimum: json['minimum'] == null
          ? null
          : DateTime.parse(json['minimum'] as String),
    );

Map<String, dynamic> _$DatesEntityToJson(DatesEntity instance) =>
    <String, dynamic>{
      'maximum': instance.maximum?.toIso8601String(),
      'minimum': instance.minimum?.toIso8601String(),
    };
