import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_db/models/entity/belongs_to_collection_entity/belongs_to_collection_entity.dart';
import 'package:the_movie_db/models/entity/genre_entity/genre_entity.dart';
import 'package:the_movie_db/models/entity/production_company_entity/production_company_entity.dart';
import 'package:the_movie_db/models/entity/production_country_entity/production_country_entity.dart';
import 'package:the_movie_db/models/entity/spoken_language_entity/spoken_language_entity.dart';

part 'detail_film_entity.g.dart';

@JsonSerializable()
class DetailFilmEntity {
  @JsonKey(name: 'adult')
  final bool? adult;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'belongs_to_collection')
  final BelongsToCollectionEntity? belongsToCollection;

  @JsonKey(name: 'budget')
  final int? budget;

  @JsonKey(name: 'genres')
  final List<GenreEntity>? genres;

  @JsonKey(name: 'home_page')
  final String? homepage;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'imdb_id')
  final String? imdbId;

  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'original_title')
  final String? originalTitle;

  @JsonKey(name: 'overview')
  final String? overview;

  @JsonKey(name: 'popularity')
  final double? popularity;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'production_companies')
  final List<ProductionCompanyEntity>? productionCompanies;

  @JsonKey(name: 'production_countries')
  final List<ProductionCountryEntity>? productionCountries;

  @JsonKey(name: 'release_date')
  final DateTime? releaseDate;

  @JsonKey(name: 'revenue')
  final int? revenue;

  @JsonKey(name: 'runtime')
  final int? runtime;

  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguageEntity>? spokenLanguages;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'tag_line')
  final String? tagline;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'video')
  final bool? video;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  DetailFilmEntity(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  String get posterUrl {
    return 'https://image.tmdb.org/t/p/w185${posterPath ?? ""}';
  }

  String get backdropUrl {
    return 'https://image.tmdb.org/t/p/w185${backdropPath ?? ""}';
  }

  factory DetailFilmEntity.fromJson(Map<String, dynamic> json) =>
      _$DetailFilmEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DetailFilmEntityToJson(this);
}
