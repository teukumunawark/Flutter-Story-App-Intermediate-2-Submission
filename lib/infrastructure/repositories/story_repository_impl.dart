import 'dart:io';
import 'package:dartz/dartz.dart';

import '../../application/models/story/story_model.dart';
import '../../domain/entities/story_enitities.dart';
import '../../domain/exceptions.dart';
import '../../domain/repositories/story_repository.dart';
import '../data_sources/remote_api.dart';
import '../exceptions.dart';

class StoryRepositoryIMPL implements StoryRepository {
  final RemoteDataSource dataSource;

  StoryRepositoryIMPL({required this.dataSource});

  @override
  Future<Either<Failure, List<StoryResponseEntity>>> getStories([
    String? token,
    int page = 1,
    int size = 10,
  ]) async {
    try {
      final result = await dataSource.getStories(token!, page, size);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, void>> createStory(
    StoryCreateModel story,
    String token,
  ) async {
    try {
      final result = await dataSource.createStory(story, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, StoryResponseEntity>> getDetailStories(
      String id, String token) async {
    try {
      final result = await dataSource.getDetailStories(token, id);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
