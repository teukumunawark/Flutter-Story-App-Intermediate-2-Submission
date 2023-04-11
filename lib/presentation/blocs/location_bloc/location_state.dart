part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationSelected extends LocationState {
  final double longitude;
  final double latitude;

  const LocationSelected(this.longitude, this.latitude);

  @override
  List<Object> get props => [longitude, latitude];
}
