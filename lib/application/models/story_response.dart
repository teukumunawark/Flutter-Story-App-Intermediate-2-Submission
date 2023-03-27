import 'package:equatable/equatable.dart';

import '../../domain/entities/story_enitities.dart';

class StoriesResponse extends Equatable {
  final List<StoryModel> listStory;

  const StoriesResponse({required this.listStory});

  factory StoriesResponse.fromJson(Map<String, dynamic> json) =>
      StoriesResponse(
        listStory: List<StoryModel>.from((json["listStory"] as List)
            .map((x) => StoryModel.fromJson(x))
            .where((element) => element.name != null)),
      );

  Map<String, dynamic> toJson() => {
        'listStory': listStory.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [listStory];
}

class StoryModel extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? photoUrl;
  final DateTime? createdAt;
  final double? lat;
  final double? lon;

  const StoryModel({
    this.id,
    this.name,
    this.description,
    this.photoUrl,
    this.createdAt,
    this.lat,
    this.lon,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      photoUrl: json['photoUrl'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lat: json['lat'] is double ? json['lat'] as double : null,
      lon: json['lon'] is double ? json['lon'] as double : null,
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'photoUrl': photoUrl,
        'createdAt': createdAt?.toIso8601String(),
        'lat': lat,
        'lon': lon,
      };

  StoryResponseEntity toEntity() => StoryResponseEntity(
        id: id,
        lat: lat,
        lon: lon,
        name: name,
        description: description,
        photoUrl: photoUrl,
        createdAt: createdAt,
      );

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      photoUrl,
      createdAt,
      lat,
      lon,
    ];
  }
}
