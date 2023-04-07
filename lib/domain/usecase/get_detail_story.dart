import 'package:dartz/dartz.dart';

import '../entities/story_enitities.dart';
import '../exceptions.dart';
import '../repositories/story_repository.dart';

class GetDetailStories {
  final StoryRepository repository;

  GetDetailStories(this.repository);

  Future<Either<Failure, StoryResponseEntity>> execute(
    String id,
    String token,
  ) {
    return repository.getDetailStories(id, token);
  }
}
