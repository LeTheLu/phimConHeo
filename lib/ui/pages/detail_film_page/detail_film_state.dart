import 'package:equatable/equatable.dart';
import 'package:the_movie_db/models/entity/credits_entity/credits_entity.dart';
import 'package:the_movie_db/models/entity/detail_film_entity/detail_film_entity.dart';
import 'package:the_movie_db/models/enum/status_enum.dart';

class DetailFilmState extends Equatable {
  final DetailFilmEntity? detailFilmEntity;
  final CreditsEntity? creditsEntity;
  final StatusEnum? loadCreditsFilmStatus;
  final StatusEnum? loadDetailFilmStatus;

  const DetailFilmState({
    this.loadDetailFilmStatus,
    this.detailFilmEntity,
    this.creditsEntity,
    this.loadCreditsFilmStatus,
  });

  @override
  List<Object?> get props => [
        detailFilmEntity,
        creditsEntity,
        loadCreditsFilmStatus,
        loadDetailFilmStatus,
      ];

  DetailFilmState copyWith({
    DetailFilmEntity? detailFilmEntity,
    CreditsEntity? creditsEntity,
    StatusEnum? loadCreditsFilmStatus,
    StatusEnum? loadDetailFilmStatus,
  }) {
    return DetailFilmState(
      detailFilmEntity: detailFilmEntity ?? this.detailFilmEntity,
      creditsEntity: creditsEntity ?? this.creditsEntity,
      loadCreditsFilmStatus: loadCreditsFilmStatus ?? this.loadCreditsFilmStatus,
      loadDetailFilmStatus: loadDetailFilmStatus ?? this.loadDetailFilmStatus,
    );
  }
}
