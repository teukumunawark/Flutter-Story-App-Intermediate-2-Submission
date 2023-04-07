// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  bool? get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  LoginResult? get loginResult => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call({bool? error, String? message, LoginResult? loginResult});

  $LoginResultCopyWith<$Res>? get loginResult;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? loginResult = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      loginResult: freezed == loginResult
          ? _value.loginResult
          : loginResult // ignore: cast_nullable_to_non_nullable
              as LoginResult?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginResultCopyWith<$Res>? get loginResult {
    if (_value.loginResult == null) {
      return null;
    }

    return $LoginResultCopyWith<$Res>(_value.loginResult!, (value) {
      return _then(_value.copyWith(loginResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoginResponseCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$_LoginResponseCopyWith(
          _$_LoginResponse value, $Res Function(_$_LoginResponse) then) =
      __$$_LoginResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? error, String? message, LoginResult? loginResult});

  @override
  $LoginResultCopyWith<$Res>? get loginResult;
}

/// @nodoc
class __$$_LoginResponseCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$_LoginResponse>
    implements _$$_LoginResponseCopyWith<$Res> {
  __$$_LoginResponseCopyWithImpl(
      _$_LoginResponse _value, $Res Function(_$_LoginResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? loginResult = freezed,
  }) {
    return _then(_$_LoginResponse(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      loginResult: freezed == loginResult
          ? _value.loginResult
          : loginResult // ignore: cast_nullable_to_non_nullable
              as LoginResult?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginResponse implements _LoginResponse {
  const _$_LoginResponse({this.error, this.message, this.loginResult});

  factory _$_LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$$_LoginResponseFromJson(json);

  @override
  final bool? error;
  @override
  final String? message;
  @override
  final LoginResult? loginResult;

  @override
  String toString() {
    return 'LoginResponse(error: $error, message: $message, loginResult: $loginResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginResponse &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.loginResult, loginResult) ||
                other.loginResult == loginResult));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message, loginResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginResponseCopyWith<_$_LoginResponse> get copyWith =>
      __$$_LoginResponseCopyWithImpl<_$_LoginResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginResponseToJson(
      this,
    );
  }

  @override
  AuthResEntities toEntity() => AuthResEntities(
        error: error,
        message: message,
        loginResult: loginResult?.toEntity(),
      );
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse(
      {final bool? error,
      final String? message,
      final LoginResult? loginResult}) = _$_LoginResponse;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$_LoginResponse.fromJson;

  @override
  bool? get error;
  @override
  String? get message;
  @override
  LoginResult? get loginResult;
  @override
  @JsonKey(ignore: true)
  _$$_LoginResponseCopyWith<_$_LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) {
  return _LoginResult.fromJson(json);
}

/// @nodoc
mixin _$LoginResult {
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResultCopyWith<LoginResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResultCopyWith<$Res> {
  factory $LoginResultCopyWith(
          LoginResult value, $Res Function(LoginResult) then) =
      _$LoginResultCopyWithImpl<$Res, LoginResult>;
  @useResult
  $Res call({String userId, String name, String token});
}

/// @nodoc
class _$LoginResultCopyWithImpl<$Res, $Val extends LoginResult>
    implements $LoginResultCopyWith<$Res> {
  _$LoginResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginResultCopyWith<$Res>
    implements $LoginResultCopyWith<$Res> {
  factory _$$_LoginResultCopyWith(
          _$_LoginResult value, $Res Function(_$_LoginResult) then) =
      __$$_LoginResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String name, String token});
}

/// @nodoc
class __$$_LoginResultCopyWithImpl<$Res>
    extends _$LoginResultCopyWithImpl<$Res, _$_LoginResult>
    implements _$$_LoginResultCopyWith<$Res> {
  __$$_LoginResultCopyWithImpl(
      _$_LoginResult _value, $Res Function(_$_LoginResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? token = null,
  }) {
    return _then(_$_LoginResult(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginResult implements _LoginResult {
  const _$_LoginResult(
      {required this.userId, required this.name, required this.token});

  factory _$_LoginResult.fromJson(Map<String, dynamic> json) =>
      _$$_LoginResultFromJson(json);

  @override
  final String userId;
  @override
  final String name;
  @override
  final String token;

  @override
  String toString() {
    return 'LoginResult(userId: $userId, name: $name, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginResult &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, name, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginResultCopyWith<_$_LoginResult> get copyWith =>
      __$$_LoginResultCopyWithImpl<_$_LoginResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginResultToJson(
      this,
    );
  }

  @override
  LoginResultEntities toEntity() => LoginResultEntities(
        userId: userId,
        name: name,
        token: token,
      );
}

abstract class _LoginResult implements LoginResult {
  const factory _LoginResult(
      {required final String userId,
      required final String name,
      required final String token}) = _$_LoginResult;

  factory _LoginResult.fromJson(Map<String, dynamic> json) =
      _$_LoginResult.fromJson;

  @override
  String get userId;
  @override
  String get name;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_LoginResultCopyWith<_$_LoginResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserCreateModel {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCreateModelCopyWith<UserCreateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCreateModelCopyWith<$Res> {
  factory $UserCreateModelCopyWith(
          UserCreateModel value, $Res Function(UserCreateModel) then) =
      _$UserCreateModelCopyWithImpl<$Res, UserCreateModel>;
  @useResult
  $Res call({String? name, String? email, String? password});
}

/// @nodoc
class _$UserCreateModelCopyWithImpl<$Res, $Val extends UserCreateModel>
    implements $UserCreateModelCopyWith<$Res> {
  _$UserCreateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCreateCopyWith<$Res>
    implements $UserCreateModelCopyWith<$Res> {
  factory _$$_UserCreateCopyWith(
          _$_UserCreate value, $Res Function(_$_UserCreate) then) =
      __$$_UserCreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? email, String? password});
}

/// @nodoc
class __$$_UserCreateCopyWithImpl<$Res>
    extends _$UserCreateModelCopyWithImpl<$Res, _$_UserCreate>
    implements _$$_UserCreateCopyWith<$Res> {
  __$$_UserCreateCopyWithImpl(
      _$_UserCreate _value, $Res Function(_$_UserCreate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_UserCreate(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UserCreate implements _UserCreate {
  _$_UserCreate({this.name, this.email, this.password});

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? password;

  @override
  String toString() {
    return 'UserCreateModel(name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserCreate &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCreateCopyWith<_$_UserCreate> get copyWith =>
      __$$_UserCreateCopyWithImpl<_$_UserCreate>(this, _$identity);
}

abstract class _UserCreate implements UserCreateModel {
  factory _UserCreate(
      {final String? name,
      final String? email,
      final String? password}) = _$_UserCreate;

  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$_UserCreateCopyWith<_$_UserCreate> get copyWith =>
      throw _privateConstructorUsedError;
}
