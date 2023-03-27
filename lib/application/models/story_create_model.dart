import 'package:equatable/equatable.dart';

class StoryCreateModel extends Equatable {
  final double? lon;
  final double? lat;
  final String? photo;
  final String? description;

  const StoryCreateModel({
    this.lon,
    this.lat,
    this.photo,
    this.description,
  });

  @override
  List<Object?> get props => [
        lon,
        lat,
        photo,
        description,
      ];
}
