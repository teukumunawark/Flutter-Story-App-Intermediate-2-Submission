import 'package:dartz/dartz.dart';

import '../../application/models/story_create_model.dart';
import '../exceptions.dart';
import '../repositories/story_repository.dart';

class CreateStory {
  final StoryRepository repository;

  CreateStory(this.repository);

  Future<Either<Failure, void>> execute(StoryCreateModel story, String token) {
    return repository.createStory(story, token);
  }
}
