import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/login_entities.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    bool? error,
    String? message,
    LoginResult? loginResult,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  AuthResEntities toEntity() => AuthResEntities(
        error: error,
        message: message,
        loginResult: loginResult?.toEntity(),
      );
}

@freezed
abstract class LoginResult with _$LoginResult {
  const factory LoginResult({
    required String userId,
    required String name,
    required String token,
  }) = _LoginResult;

  factory LoginResult.fromJson(Map<String, dynamic> json) =>
      _$LoginResultFromJson(json);

  LoginResultEntities toEntity() => LoginResultEntities(
        userId: userId,
        name: name,
        token: token,
      );
}

@freezed
abstract class UserCreateModel with _$UserCreateModel {
  factory UserCreateModel({
    String? name,
    String? email,
    String? password,
  }) = _UserCreate;
}
