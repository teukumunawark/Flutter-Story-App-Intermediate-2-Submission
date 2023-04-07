// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoriesResponse _$StoriesResponseFromJson(Map<String, dynamic> json) {
  return _StoriesResponse.fromJson(json);
}

/// @nodoc
mixin _$StoriesResponse {
  List<StoryModel> get listStory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoriesResponseCopyWith<StoriesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoriesResponseCopyWith<$Res> {
  factory $StoriesResponseCopyWith(
          StoriesResponse value, $Res Function(StoriesResponse) then) =
      _$StoriesResponseCopyWithImpl<$Res, StoriesResponse>;
  @useResult
  $Res call({List<StoryModel> listStory});
}

/// @nodoc
class _$StoriesResponseCopyWithImpl<$Res, $Val extends StoriesResponse>
    implements $StoriesResponseCopyWith<$Res> {
  _$StoriesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listStory = null,
  }) {
    return _then(_value.copyWith(
      listStory: null == listStory
          ? _value.listStory
          : listStory // ignore: cast_nullable_to_non_nullable
              as List<StoryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoriesResponseCopyWith<$Res>
    implements $StoriesResponseCopyWith<$Res> {
  factory _$$_StoriesResponseCopyWith(
          _$_StoriesResponse value, $Res Function(_$_StoriesResponse) then) =
      __$$_StoriesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<StoryModel> listStory});
}

/// @nodoc
class __$$_StoriesResponseCopyWithImpl<$Res>
    extends _$StoriesResponseCopyWithImpl<$Res, _$_StoriesResponse>
    implements _$$_StoriesResponseCopyWith<$Res> {
  __$$_StoriesResponseCopyWithImpl(
      _$_StoriesResponse _value, $Res Function(_$_StoriesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listStory = null,
  }) {
    return _then(_$_StoriesResponse(
      listStory: null == listStory
          ? _value._listStory
          : listStory // ignore: cast_nullable_to_non_nullable
              as List<StoryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoriesResponse implements _StoriesResponse {
  const _$_StoriesResponse({required final List<StoryModel> listStory})
      : _listStory = listStory;

  factory _$_StoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StoriesResponseFromJson(json);

  final List<StoryModel> _listStory;
  @override
  List<StoryModel> get listStory {
    if (_listStory is EqualUnmodifiableListView) return _listStory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listStory);
  }

  @override
  String toString() {
    return 'StoriesResponse(listStory: $listStory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoriesResponse &&
            const DeepCollectionEquality()
                .equals(other._listStory, _listStory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_listStory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoriesResponseCopyWith<_$_StoriesResponse> get copyWith =>
      __$$_StoriesResponseCopyWithImpl<_$_StoriesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoriesResponseToJson(
      this,
    );
  }
}

abstract class _StoriesResponse implements StoriesResponse {
  const factory _StoriesResponse({required final List<StoryModel> listStory}) =
      _$_StoriesResponse;

  factory _StoriesResponse.fromJson(Map<String, dynamic> json) =
      _$_StoriesResponse.fromJson;

  @override
  List<StoryModel> get listStory;
  @override
  @JsonKey(ignore: true)
  _$$_StoriesResponseCopyWith<_$_StoriesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) {
  return _StoryModel.fromJson(json);
}

/// @nodoc
mixin _$StoryModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryModelCopyWith<StoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryModelCopyWith<$Res> {
  factory $StoryModelCopyWith(
          StoryModel value, $Res Function(StoryModel) then) =
      _$StoryModelCopyWithImpl<$Res, StoryModel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? photoUrl,
      DateTime? createdAt,
      double? lat,
      double? lon});
}

/// @nodoc
class _$StoryModelCopyWithImpl<$Res, $Val extends StoryModel>
    implements $StoryModelCopyWith<$Res> {
  _$StoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoryModelCopyWith<$Res>
    implements $StoryModelCopyWith<$Res> {
  factory _$$_StoryModelCopyWith(
          _$_StoryModel value, $Res Function(_$_StoryModel) then) =
      __$$_StoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? photoUrl,
      DateTime? createdAt,
      double? lat,
      double? lon});
}

/// @nodoc
class __$$_StoryModelCopyWithImpl<$Res>
    extends _$StoryModelCopyWithImpl<$Res, _$_StoryModel>
    implements _$$_StoryModelCopyWith<$Res> {
  __$$_StoryModelCopyWithImpl(
      _$_StoryModel _value, $Res Function(_$_StoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_$_StoryModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoryModel implements _StoryModel {
  const _$_StoryModel(
      {this.id,
      this.name,
      this.description,
      this.photoUrl,
      this.createdAt,
      this.lat,
      this.lon});

  factory _$_StoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_StoryModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? photoUrl;
  @override
  final DateTime? createdAt;
  @override
  final double? lat;
  @override
  final double? lon;

  @override
  String toString() {
    return 'StoryModel(id: $id, name: $name, description: $description, photoUrl: $photoUrl, createdAt: $createdAt, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, photoUrl, createdAt, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoryModelCopyWith<_$_StoryModel> get copyWith =>
      __$$_StoryModelCopyWithImpl<_$_StoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoryModelToJson(
      this,
    );
  }

  @override
  StoryResponseEntity toEntity() => StoryResponseEntity(
        id: id,
        lat: lat,
        lon: lon,
        name: name,
        description: description,
        photoUrl: photoUrl,
        createdAt: createdAt,
      );
}

abstract class _StoryModel implements StoryModel {
  const factory _StoryModel(
      {final String? id,
      final String? name,
      final String? description,
      final String? photoUrl,
      final DateTime? createdAt,
      final double? lat,
      final double? lon}) = _$_StoryModel;

  factory _StoryModel.fromJson(Map<String, dynamic> json) =
      _$_StoryModel.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get photoUrl;
  @override
  DateTime? get createdAt;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  @JsonKey(ignore: true)
  _$$_StoryModelCopyWith<_$_StoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StoryCreateModel {
  double? get lon => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryCreateModelCopyWith<StoryCreateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryCreateModelCopyWith<$Res> {
  factory $StoryCreateModelCopyWith(
          StoryCreateModel value, $Res Function(StoryCreateModel) then) =
      _$StoryCreateModelCopyWithImpl<$Res, StoryCreateModel>;
  @useResult
  $Res call({double? lon, double? lat, String? photo, String? description});
}

/// @nodoc
class _$StoryCreateModelCopyWithImpl<$Res, $Val extends StoryCreateModel>
    implements $StoryCreateModelCopyWith<$Res> {
  _$StoryCreateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lon = freezed,
    Object? lat = freezed,
    Object? photo = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoryCreateCopyWith<$Res>
    implements $StoryCreateModelCopyWith<$Res> {
  factory _$$_StoryCreateCopyWith(
          _$_StoryCreate value, $Res Function(_$_StoryCreate) then) =
      __$$_StoryCreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? lon, double? lat, String? photo, String? description});
}

/// @nodoc
class __$$_StoryCreateCopyWithImpl<$Res>
    extends _$StoryCreateModelCopyWithImpl<$Res, _$_StoryCreate>
    implements _$$_StoryCreateCopyWith<$Res> {
  __$$_StoryCreateCopyWithImpl(
      _$_StoryCreate _value, $Res Function(_$_StoryCreate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lon = freezed,
    Object? lat = freezed,
    Object? photo = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_StoryCreate(
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_StoryCreate implements _StoryCreate {
  _$_StoryCreate({this.lon, this.lat, this.photo, this.description});

  @override
  final double? lon;
  @override
  final double? lat;
  @override
  final String? photo;
  @override
  final String? description;

  @override
  String toString() {
    return 'StoryCreateModel(lon: $lon, lat: $lat, photo: $photo, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoryCreate &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lon, lat, photo, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoryCreateCopyWith<_$_StoryCreate> get copyWith =>
      __$$_StoryCreateCopyWithImpl<_$_StoryCreate>(this, _$identity);
}

abstract class _StoryCreate implements StoryCreateModel {
  factory _StoryCreate(
      {final double? lon,
      final double? lat,
      final String? photo,
      final String? description}) = _$_StoryCreate;

  @override
  double? get lon;
  @override
  double? get lat;
  @override
  String? get photo;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_StoryCreateCopyWith<_$_StoryCreate> get copyWith =>
      throw _privateConstructorUsedError;
}
