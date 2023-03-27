part of 'auth_bloc_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class OnRegisterEvent extends AuthEvent {
  final UserCreateModel user;

  const OnRegisterEvent(this.user);

  @override
  List<Object> get props => [user];
}

class OnLoginEvent extends AuthEvent {
  final UserCreateModel user;

  const OnLoginEvent(this.user);

  @override
  List<Object> get props => [user];
}

class OnLogoutEvent extends AuthEvent {}
