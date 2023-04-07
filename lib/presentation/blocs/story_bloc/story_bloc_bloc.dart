import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../application/models/story_create_model.dart';
import '../../../domain/entities/story_enitities.dart';
import '../../../domain/usecase/create_story.dart';
import '../../../domain/usecase/get_all_story.dart';
import '../../../domain/usecase/get_detail_story.dart';

part 'story_bloc_event.dart';
part 'story_bloc_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final GetStories _getStories;
  final CreateStory _createStory;

  StoryBloc(
    this._getStories,
    this._createStory,
  ) : super(StoryInitial()) {
    on<OnGetStoriesEvent>((event, emit) async {
      final token = event._token;

      emit(StoryLoading());
      final result = await _getStories.execute(token);

      result.fold(
        (failure) => emit(StoryHasError(failure.message)),
        (data) => emit(StoryLoaded(data)),
      );
    });

    on<OnCreateStoryEvent>((event, emit) async {
      final story = event._story;
      final token = event._token;

      emit(StoryLoading());
      final result = await _createStory.execute(story, token);

      result.fold(
        (failure) => emit(StoryHasError(failure.message)),
        (_) => emit(StoryCreated()),
      );
    });
  }
}

class StoriesDetailBloc extends Bloc<StoryEvent, StoryState> {
  final GetDetailStories _detailStories;

  StoriesDetailBloc(this._detailStories) : super(StoryDetailLoading()) {
    on<OnGetDetailEvent>((event, emit) async {
      final id = event._id;
      final token = event._token;

      emit(StoryDetailLoading());

      final result = await _detailStories.execute(id, token);

      result.fold(
        (failure) => emit(StoryHasError(failure.message)),
        (data) => emit(StoriesDetailLoaded(data)),
      );
    });
  }
}
