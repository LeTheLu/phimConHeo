import 'package:dio/dio.dart';
import 'package:the_movie_db/configs/app_config.dart';
import 'package:the_movie_db/network/api_client.dart';

class ApiUtil {
  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = 60000;
    }
    return dio!;
  }

  static ApiClient get apiClient {
    final apiClient = ApiClient(getDio(),baseUrl: AppConfig.baseUrl);
    return apiClient;
  }
}