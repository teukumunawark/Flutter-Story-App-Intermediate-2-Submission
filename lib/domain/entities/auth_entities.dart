import 'package:equatable/equatable.dart';

class UserResponseEntity extends Equatable {
  final String userId;
  final String name;
  final String token;

  const UserResponseEntity({
    required this.userId,
    required this.name,
    required this.token,
  });

  @override
  List<Object?> get props => [userId, name, token];
}

class AuthResEntities extends Equatable {
  final bool? error;
  final String? message;
  final LoginResultEntities? loginResult;

  const AuthResEntities({this.error, this.message, this.loginResult});

  @override
  List<Object?> get props => [error, message, loginResult];
}

class LoginResultEntities extends Equatable {
  final String? userId;
  final String? name;
  final String? token;

  const LoginResultEntities({this.userId, this.name, this.token});

  @override
  List<Object?> get props => [userId, name, token];
}
