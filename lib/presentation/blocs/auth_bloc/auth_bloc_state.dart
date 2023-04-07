part of 'auth_bloc_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object> get props => [message];
}

class RegisterSuccess extends AuthState {}

class LoginSuccess extends AuthState {
  final AuthResEntities data;

  const LoginSuccess(this.data);

  @override
  List<Object> get props => [data];
}
