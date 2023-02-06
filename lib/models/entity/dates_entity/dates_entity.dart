
import 'package:json_annotation/json_annotation.dart';

part 'dates_entity.g.dart';
@JsonSerializable()
class DatesEntity {

  @JsonKey(name: 'maximum')
  DateTime? maximum;

  @JsonKey(name: 'minimum')
  DateTime? minimum;

  DatesEntity({this.maximum, this.minimum});

  factory DatesEntity.fromJson(Map<String,dynamic> json) => _$DatesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DatesEntityToJson(this);
}