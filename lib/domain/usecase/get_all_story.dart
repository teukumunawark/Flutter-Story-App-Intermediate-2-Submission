import 'package:dartz/dartz.dart';

import '../entities/story_enitities.dart';
import '../exceptions.dart';
import '../repositories/story_repository.dart';

class GetStories {
  final StoryRepository repository;

  GetStories(this.repository);

  Future<Either<Failure, List<StoryResponseEntity>>> execute([
    String? token,
    int page = 1,
    int size = 10,
  ]) {
    return repository.getStories(token!, page, size);
  }
}
