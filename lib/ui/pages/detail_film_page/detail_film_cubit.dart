import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db/configs/app_config.dart';
import 'package:the_movie_db/models/enum/status_enum.dart';
import 'package:the_movie_db/network/api_client.dart';
import 'package:the_movie_db/ui/pages/detail_film_page/detail_film_state.dart';

class DetailFilmCubit extends Cubit<DetailFilmState> {
  ApiClient apiClient;

  DetailFilmCubit({required this.apiClient}) : super(const DetailFilmState());

  void initData({required String movieID}) async {
    await getDetailFilm(movieID);
    await getCreditsFilm(movieID);
  }

  Future<void> getDetailFilm(String movieID) async {
    try {
      emit(state.copyWith(loadDetailFilmStatus: StatusEnum.loading));
      final result = await apiClient.getDetailMovies(movieID, AppConfig.apiKey);
      emit(state.copyWith(
          detailFilmEntity: result, loadDetailFilmStatus: StatusEnum.success));
    } catch (e) {
      emit(state.copyWith(loadDetailFilmStatus: StatusEnum.fail));
      debugPrint(e.toString());
    }
  }

  Future<void> getCreditsFilm(String movieID) async {
    try {
      emit(state.copyWith(loadCreditsFilmStatus: StatusEnum.loading));
      final result = await apiClient.getActor(movieID, AppConfig.apiKey);
      emit(state.copyWith(
          loadCreditsFilmStatus: StatusEnum.success, creditsEntity: result));
    } catch (e) {
      emit(state.copyWith(loadCreditsFilmStatus: StatusEnum.fail));
      print(e);
    }
  }
}
