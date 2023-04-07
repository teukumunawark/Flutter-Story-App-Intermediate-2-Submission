import 'dart:io';

import 'package:equatable/equatable.dart';

class StoryEntity extends Equatable {
  final File? photo;
  final String? description;
  final double? lat;
  final double? lon;

  const StoryEntity({
    this.description,
    this.photo,
    this.lat,
    this.lon,
  });

  @override
  List<Object?> get props => [description, photo, lat, lon];
}

class StoryResponseEntity extends Equatable {
  final String? id;
  final double? lat;
  final double? lon;
  final String? name;
  final String? photoUrl;
  final DateTime? createdAt;
  final String? description;

  const StoryResponseEntity({
    this.id,
    this.lat,
    this.lon,
    this.name,
    this.photoUrl,
    this.createdAt,
    this.description,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        photoUrl,
        createdAt,
        lat,
        lon,
      ];
}
