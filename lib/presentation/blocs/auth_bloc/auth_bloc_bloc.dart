import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../application/models/user_create_model.dart';
import '../../../domain/entities/auth_entities.dart';
import '../../../domain/usecase/create_user_login.dart';
import '../../../domain/usecase/create_user_register.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CreateUserRegister _createUserRegister;
  final CreateUserLogin _createUserLogin;

  AuthBloc(
    this._createUserRegister,
    this._createUserLogin,
  ) : super(AuthInitial()) {
    on<OnRegisterEvent>((event, emit) async {
      final user = event.user;
      emit(AuthLoading());
      final result = await _createUserRegister.execute(user);
      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (_) => emit(RegisterSuccess()),
      );
    });

    on<OnLoginEvent>((event, emit) async {
      final user = event.user;
      emit(AuthLoading());
      final result = await _createUserLogin.execute(user);
      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (data) => emit(LoginSuccess(data)),
      );
    });

    on<OnLogoutEvent>((event, emit) => emit(AuthInitial()));
  }
}
