import 'package:dartz/dartz.dart';

import '../../application/models/story/story_model.dart';
import '../entities/story_enitities.dart';
import '../exceptions.dart';

abstract class StoryRepository {
  Future<Either<Failure, List<StoryResponseEntity>>> getStories([
    String? token,
    int page = 1,
    int size = 10,
  ]);
  Future<Either<Failure, void>> createStory(
    StoryCreateModel story,
    String toke,
  );
  Future<Either<Failure, StoryResponseEntity>> getDetailStories(
    String id,
    String token,
  );
}
