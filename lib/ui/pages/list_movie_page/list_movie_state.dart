part of 'list_movie_cubit.dart';

class ListMovieState extends Equatable {
  final MostPopularMovieEntity? mostPopularMovieEntity;
  final UpcomingMovieEntity? upcomingMovieEntity;
  final StatusEnum? loadPopularMovieStatus;
  final StatusEnum? loadUpcomingMovieStatus;
  final int? selectedIndexMostPopular;
  final int? selectedIndexUpcoming;

  const ListMovieState(
      {this.mostPopularMovieEntity,
      this.upcomingMovieEntity,
      this.loadPopularMovieStatus,
      this.loadUpcomingMovieStatus,
      this.selectedIndexMostPopular = 0,
      this.selectedIndexUpcoming = 0});

  @override
  List<Object?> get props => [
        mostPopularMovieEntity,
        upcomingMovieEntity,
        loadPopularMovieStatus,
        loadUpcomingMovieStatus,
        selectedIndexMostPopular,
        selectedIndexUpcoming,
      ];

  ListMovieState copyWith({
    MostPopularMovieEntity? mostPopularMovieEntity,
    UpcomingMovieEntity? upcomingMovieEntity,
    StatusEnum? loadPopularMovieStatus,
    StatusEnum? loadUpcomingMovieStatus,
    int? selectedIndexMostPopular,
    int? selectedIndexUpcoming,
  }) {
    return ListMovieState(
      mostPopularMovieEntity:
          mostPopularMovieEntity ?? this.mostPopularMovieEntity,
      upcomingMovieEntity: upcomingMovieEntity ?? this.upcomingMovieEntity,
      loadPopularMovieStatus:
          loadPopularMovieStatus ?? this.loadPopularMovieStatus,
      loadUpcomingMovieStatus:
          loadUpcomingMovieStatus ?? this.loadUpcomingMovieStatus,
      selectedIndexMostPopular:
          selectedIndexMostPopular ?? this.selectedIndexMostPopular,
      selectedIndexUpcoming:
          selectedIndexUpcoming ?? this.selectedIndexUpcoming,
    );
  }
}
