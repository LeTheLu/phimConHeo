import 'package:json_annotation/json_annotation.dart';

part 'production_company_entity.g.dart';
@JsonSerializable()
class ProductionCompanyEntity {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'logo_path')
  final String? logoPath;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'origin_country')
  final String? originCountry;

  ProductionCompanyEntity(
      {this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompanyEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyEntityToJson(this);
}
