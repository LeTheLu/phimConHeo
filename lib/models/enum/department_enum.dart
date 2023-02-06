
enum DepartmentEnum {
  ACTING,
  DIRECTING,
  EDITING,
  WRITING,
  PRODUCTION,
  SOUND,
  ART,
  VISUAL_EFFECTS,
  CREW,
  CAMERA,
  NORMAL
}

extension DepartmentEnumExtension on DepartmentEnum {
  static DepartmentEnum getDepartmentEnum(String? value) {
    switch (value) {
      case "Acting":
        return DepartmentEnum.ACTING;
      case "Directing":
        return DepartmentEnum.DIRECTING;
      case "Editing":
        return DepartmentEnum.EDITING;
      case "Writing":
        return DepartmentEnum.WRITING;
      case "Production":
        return DepartmentEnum.PRODUCTION;
      case "Sound":
        return DepartmentEnum.SOUND;
      case "Art":
        return DepartmentEnum.ART;
      case "Visual Effects":
        return DepartmentEnum.VISUAL_EFFECTS;
      case "Crew":
        return DepartmentEnum.CREW;
      case "Camera":
        return DepartmentEnum.CAMERA;
      default:
        return DepartmentEnum.NORMAL;
    }
  }
}
