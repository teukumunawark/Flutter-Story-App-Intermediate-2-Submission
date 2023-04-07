import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/story_enitities.dart';

part 'story_model.freezed.dart';
part 'story_model.g.dart';

@freezed
class StoriesResponse with _$StoriesResponse {
  const factory StoriesResponse({
    required List<StoryModel> listStory,
  }) = _StoriesResponse;

  factory StoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$StoriesResponseFromJson(json);
}

@freezed
class StoryModel with _$StoryModel {
  const factory StoryModel({
    String? id,
    String? name,
    String? description,
    String? photoUrl,
    DateTime? createdAt,
    double? lat,
    double? lon,
  }) = _StoryModel;

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);

  StoryResponseEntity toEntity() => StoryResponseEntity(
        id: id,
        lat: lat,
        lon: lon,
        name: name,
        description: description,
        photoUrl: photoUrl,
        createdAt: createdAt,
      );
}

@freezed
class StoryCreateModel with _$StoryCreateModel {
  factory StoryCreateModel({
    double? lon,
    double? lat,
    String? photo,
    String? description,
  }) = _StoryCreate;
}
