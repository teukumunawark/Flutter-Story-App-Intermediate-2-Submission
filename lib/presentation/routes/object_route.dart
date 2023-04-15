import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RouteObject extends Equatable {
  final String? token;
  final double? latitude;
  final double? longitude;

  const RouteObject(this.token, this.latitude, this.longitude);

  @override
  List<Object?> get props => [latitude, longitude];
}

@immutable
class Coordinate {
  final double? latitude;
  final double? longitude;

  const Coordinate(this.latitude, this.longitude);
}
