part of 'story_bloc_bloc.dart';

abstract class StoryState extends Equatable {
  const StoryState();

  @override
  List<Object> get props => [];
}

class StoryInitial extends StoryState {}

class StoryLoading extends StoryState {}

class StoryHasError extends StoryState {
  final String message;

  const StoryHasError(this.message);

  @override
  List<Object> get props => [message];
}

class StoryLoaded extends StoryState {
  final List<StoryResponseEntity> data;

  const StoryLoaded(this.data);

  @override
  List<Object> get props => [data];

  List<StoryResponseEntity> get getData => data;
}

class StoryCreated extends StoryState {}

// Detail State
class StoryDetailLoading extends StoryState {}

class StoryDetailError extends StoryState {
  final String message;

  const StoryDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class StoriesDetailLoaded extends StoryState {
  final StoryResponseEntity data;

  const StoriesDetailLoaded(this.data);

  @override
  List<Object> get props => [data];
}
