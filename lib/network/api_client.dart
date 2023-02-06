import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:the_movie_db/models/entity/credits_entity/credits_entity.dart';
import 'package:the_movie_db/models/entity/detail_film_entity/detail_film_entity.dart';
import 'package:the_movie_db/models/entity/most_popular_movie_entity/most_popular_movie_entity.dart';
import 'package:the_movie_db/models/entity/upcoming_movie_entity/upcoming_movie_entity.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/3/movie/popular?")
  Future<MostPopularMovieEntity> getPopularMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET("/3/movie/upcoming?")
  Future<UpcomingMovieEntity> getUpcomingMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET("/3/movie/{movie_id}?")
  Future<DetailFilmEntity> getDetailMovies(
    @Path('movie_id') String movieID,
    @Query('api_key') String apiKey,
  );

  @GET("/3/movie/{movie_id}/credits?")
  Future<CreditsEntity> getActor(
    @Path('movie_id') String movieID,
    @Query('api_key') String apiKey,
  );
}
