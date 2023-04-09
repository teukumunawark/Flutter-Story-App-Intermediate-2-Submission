import 'package:dio/dio.dart';
import 'package:story_app_intermediate_final/application/models/auth/auth_model.dart';

import '../../application/models/story/story_model.dart';
import '../exceptions.dart';

abstract class RemoteDataSource {
  Future<void> register(UserCreateModel user);
  Future<LoginResponse> login(UserCreateModel user);
  Future<List<StoryModel>> getStories(String token, int page, int size);
  Future<void> createStory(StoryCreateModel story, String token);
  Future<StoryModel> getDetailStories(String token, String id);
}

class RemoteDataSourceIMPL extends RemoteDataSource {
  RemoteDataSourceIMPL({required this.dio});

  Dio dio = Dio();
  static const apiURL = 'https://story-api.dicoding.dev/v1/';

  @override
  Future<void> register(UserCreateModel user) async {
    try {
      await dio.post('$apiURL/register', data: {
        'name': user.name,
        'email': user.email,
        'password': user.password,
      });
    } on DioError catch (e) {
      String error = e.response?.data['message'];
      throw ServerException(error);
    }
  }

  @override
  Future<LoginResponse> login(UserCreateModel user) async {
    try {
      final response = await dio.post('$apiURL/login', data: {
        'email': user.email,
        'password': user.password,
      });

      if (response.data is Map<String, dynamic>) {
        return LoginResponse.fromJson(response.data);
      } else {
        throw ServerException('Invalid response type');
      }
    } on DioError catch (e) {
      String error = e.response?.data['message'];
      throw ServerException(error);
    }
  }

  @override
  Future<List<StoryModel>> getStories([
    String? token,
    int page = 1,
    int size = 10,
  ]) async {
    try {
      dio.options.headers['Authorization'] = "Bearer $token";
      final response = await dio.get('$apiURL/stories?page=$page&size=$size');

      if (response.statusCode == 200) {
        return StoriesResponse.fromJson(response.data).listStory;
      } else {
        throw ServerException();
      }
    } on DioError catch (e) {
      String error = e.response?.data['message'];
      throw ServerException(error);
    }
  }

  @override
  Future<void> createStory(StoryCreateModel story, String token) async {
    try {
      String fileName = story.photo!.split('/').last;

      FormData formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(story.photo!, filename: fileName),
        'lon': story.lon,
        'lat': story.lat,
        'description': story.description,
      });

      dio.options.headers['Authorization'] = "Bearer $token";
      dio.options.headers['Content-Type'] = 'multipart/form-data';

      await dio.post('$apiURL/stories', data: formData);
    } on DioError catch (e) {
      String error = e.response?.data['message'];
      throw ServerException(error);
    }
  }

  @override
  Future<StoryModel> getDetailStories(String token, String id) async {
    try {
      dio.options.headers['Authorization'] = "Bearer $token";
      final response = await dio.get('$apiURL/stories/$id');

      if (response.statusCode == 200) {
        return StoryModel.fromJson(response.data['story']);
      } else {
        throw ServerException();
      }
    } on DioError catch (e) {
      String error = e.response?.data['message'];
      throw ServerException(error);
    }
  }
}
