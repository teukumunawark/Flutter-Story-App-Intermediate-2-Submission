import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<OnLocationSelected>((event, emit) {
      emit(LocationSelected(event.longitude, event.latitude));
    });

    on<OnClearLocation>((event, emit) => emit(LocationInitial()));
  }
}
