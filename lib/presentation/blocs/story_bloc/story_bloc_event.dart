part of 'story_bloc_bloc.dart';

abstract class StoryEvent extends Equatable {
  const StoryEvent();

  @override
  List<Object> get props => [];
}

class OnGetStoriesEvent extends StoryEvent {
  final String _token;

  const OnGetStoriesEvent(this._token);

  @override
  List<Object> get props => [_token];
}

class OnCreateStoryEvent extends StoryEvent {
  final StoryCreateModel _story;
  final String _token;

  const OnCreateStoryEvent(this._story, this._token);

  @override
  List<Object> get props => [_story, _token];
}

class OnGetDetailEvent extends StoryEvent {
  final String _id;
  final String _token;

  const OnGetDetailEvent(this._id, this._token);

  @override
  List<Object> get props => [_id, _token];
}
