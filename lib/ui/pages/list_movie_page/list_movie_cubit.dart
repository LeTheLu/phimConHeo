import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db/configs/app_config.dart';
import 'package:the_movie_db/models/entity/most_popular_movie_entity/most_popular_movie_entity.dart';
import 'package:the_movie_db/models/entity/upcoming_movie_entity/upcoming_movie_entity.dart';
import 'package:the_movie_db/models/enum/status_enum.dart';
import 'package:the_movie_db/network/api_client.dart';

part 'list_movie_state.dart';

class ListMovieCubit extends Cubit<ListMovieState> {
  ApiClient apiClient;

  ListMovieCubit({required this.apiClient}) : super(const ListMovieState());

  void initData() async {
    await getListPopularMovie();
    await getListUpcomingMovie();
  }

  void switchMostPopularDotIndicators(int index) {
    emit(state.copyWith(selectedIndexMostPopular: index));
  }

  void switchUpcomingDotIndicators(int index) {
    emit(state.copyWith(selectedIndexUpcoming: index));
  }

  Future<void> getListPopularMovie() async {
    try {
      emit(state.copyWith(loadPopularMovieStatus: StatusEnum.loading));
      final result = await apiClient.getPopularMovies(AppConfig.apiKey, 1);
      emit(state.copyWith(
          loadPopularMovieStatus: StatusEnum.success,
          mostPopularMovieEntity: result));
    } catch (e) {
      emit(state.copyWith(loadPopularMovieStatus: StatusEnum.fail));
      debugPrint(e.toString());
    }
  }

  Future<void> getListUpcomingMovie() async {
    try {
      emit(state.copyWith(loadUpcomingMovieStatus: StatusEnum.loading));
      final result = await apiClient.getUpcomingMovies(AppConfig.apiKey, 1);
      emit(state.copyWith(
          loadUpcomingMovieStatus: StatusEnum.success,
          upcomingMovieEntity: result));
    } catch (e) {
      emit(state.copyWith(loadUpcomingMovieStatus: StatusEnum.fail));
      debugPrint(e.toString());
    }
  }
}
