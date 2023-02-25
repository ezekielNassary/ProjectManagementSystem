import 'package:dio/dio.dart';

import '../utils/constants.dart';

class ProjectsApi {
  final dio = Dio(); //Dio(BaseOptions(baseUrl: apiBaseUrl));
  Future<dynamic> getAllProjects() async {
    final response = await dio.get(apiBaseUrl);
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      return null;
    }
  }

  Future<dynamic> getMovieDetails({required int movieId}) async {
    final response = await dio.get('/movie/$movieId?api_key=$apiKey');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }
}
