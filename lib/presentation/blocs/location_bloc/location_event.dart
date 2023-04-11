part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class OnLocationSelected extends LocationEvent {
  final double longitude;
  final double latitude;

  const OnLocationSelected(this.longitude, this.latitude);

  @override
  List<Object> get props => [longitude, latitude];
}

class OnClearLocation extends LocationEvent {}
