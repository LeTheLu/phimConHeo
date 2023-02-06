import 'package:json_annotation/json_annotation.dart';

part 'cast_entity.g.dart';

@JsonSerializable()
class CastEntity {
  @JsonKey(name: 'adult')
  final bool? adult;

  @JsonKey(name: 'gender')
  final int? gender;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'original_name')
  final String? originalName;

  @JsonKey(name: 'popularity')
  final double? popularity;

  @JsonKey(name: 'profile_path')
  final String? profilePath;

  @JsonKey(name: 'cast_id')
  final int? castId;

  @JsonKey(name: 'character')
  final String? character;

  @JsonKey(name: 'credit_id')
  final String? creditId;

  @JsonKey(name: 'order')
  final int? order;

  @JsonKey(name: 'department')
  late String? department;

  @JsonKey(name: 'job')
  final String? job;

  // DepartmentEnum get getKnownForDepartment {
  //   return department = DepartmentEnumExtension.getDepartmentEnum(
  //       knownForDepartment);
  // }

  String get getProfilePath {
    if (profilePath == null) {
      return 'https://scontent.fhan17-1.fna.fbcdn.net/v/t39.30808-6/300370141_445684364259165_8893097931255509122_n.png?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=nZar8u6xwmAAX_3I45t&_nc_ht=scontent.fhan17-1.fna&oh=00_AfCU2Ia2RyURMrjPuWH05PvuRL0da7jkq3_lKnscPvbeOQ&oe=63E115CF';
    } else {
      return 'https://image.tmdb.org/t/p/w185$profilePath';
    }
  }

  CastEntity(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order,
      this.department,
      this.job});

  factory CastEntity.fromJson(Map<String, dynamic> json) =>
      _$CastEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CastEntityToJson(this);
}
