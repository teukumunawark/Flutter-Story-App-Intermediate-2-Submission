import 'package:dartz/dartz.dart';

import '../../application/models/story_create_model.dart';
import '../entities/story_enitities.dart';
import '../exceptions.dart';

abstract class StoryRepository {
  Future<Either<Failure, List<StoryResponseEntity>>> getStories(String token);
  Future<Either<Failure, void>> createStory(
    StoryCreateModel story,
    String toke,
  );
  Future<Either<Failure, StoryResponseEntity>> getDetailStories(
    String id,
    String token,
  );
}
