// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_country_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCountryEntity _$ProductionCountryEntityFromJson(
        Map<String, dynamic> json) =>
    ProductionCountryEntity(
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductionCountryEntityToJson(
        ProductionCountryEntity instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
    };
