import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationEvent {
  const LocalizationEvent(this.locale);

  final Locale locale;
}

class SetLocale extends LocalizationEvent {
  const SetLocale(Locale locale) : super(locale);
}

class LocalizationBloc extends Bloc<LocalizationEvent, Locale> {
  LocalizationBloc() : super(const Locale('id')) {
    on<SetLocale>((event, emit) {
      emit(event.locale);
    });
  }
}
