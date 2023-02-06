
import 'package:json_annotation/json_annotation.dart';

part 'production_country_entity.g.dart';
@JsonSerializable()
class ProductionCountryEntity {

  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;

  @JsonKey(name: 'name')
  final String? name;

  ProductionCountryEntity({this.iso31661, this.name});

  factory ProductionCountryEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryEntityToJson(this);
}