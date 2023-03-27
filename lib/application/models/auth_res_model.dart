import 'package:equatable/equatable.dart';
import '../../domain/entities/auth_entities.dart';

class AuthResModel extends Equatable {
  final bool? error;
  final String? message;
  final LoginResult? loginResult;

  const AuthResModel({this.error, this.message, this.loginResult});

  factory AuthResModel.fromJson(Map<String, dynamic> json) => AuthResModel(
        error: json['error'] as bool,
        message: json['message'] as String,
        loginResult: json['loginResult'] == null
            ? null
            : LoginResult.fromJson(json['loginResult']),
      );

  AuthResEntities toEntity() => AuthResEntities(
        error: error,
        message: message,
        loginResult: loginResult?.toEntity(),
      );

  @override
  List<Object?> get props => [error, message, loginResult];
}

class LoginResult extends Equatable {
  final String? userId;
  final String? name;
  final String? token;

  const LoginResult({this.userId, this.name, this.token});

  factory LoginResult.fromJson(Map<String, dynamic> json) => LoginResult(
        name: json['name'] as String,
        userId: json['userId'] as String,
        token: json['token'] as String,
      );

  LoginResultEntities toEntity() => LoginResultEntities(
        name: name,
        token: token,
        userId: userId,
      );

  @override
  List<Object?> get props => [userId, name, token];
}
