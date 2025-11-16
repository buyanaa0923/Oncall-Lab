// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'laboratory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LaboratoryModel _$LaboratoryModelFromJson(Map<String, dynamic> json) {
  return _LaboratoryModel.fromJson(json);
}

/// @nodoc
mixin _$LaboratoryModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'operating_hours')
  Map<String, dynamic>? get operatingHours =>
      throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LaboratoryModelCopyWith<LaboratoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaboratoryModelCopyWith<$Res> {
  factory $LaboratoryModelCopyWith(
          LaboratoryModel value, $Res Function(LaboratoryModel) then) =
      _$LaboratoryModelCopyWithImpl<$Res, LaboratoryModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String address,
      @JsonKey(name: 'phone_number') String phoneNumber,
      String? email,
      @JsonKey(name: 'operating_hours') Map<String, dynamic>? operatingHours,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$LaboratoryModelCopyWithImpl<$Res, $Val extends LaboratoryModel>
    implements $LaboratoryModelCopyWith<$Res> {
  _$LaboratoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? email = freezed,
    Object? operatingHours = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      operatingHours: freezed == operatingHours
          ? _value.operatingHours
          : operatingHours // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LaboratoryModelImplCopyWith<$Res>
    implements $LaboratoryModelCopyWith<$Res> {
  factory _$$LaboratoryModelImplCopyWith(_$LaboratoryModelImpl value,
          $Res Function(_$LaboratoryModelImpl) then) =
      __$$LaboratoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String address,
      @JsonKey(name: 'phone_number') String phoneNumber,
      String? email,
      @JsonKey(name: 'operating_hours') Map<String, dynamic>? operatingHours,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$LaboratoryModelImplCopyWithImpl<$Res>
    extends _$LaboratoryModelCopyWithImpl<$Res, _$LaboratoryModelImpl>
    implements _$$LaboratoryModelImplCopyWith<$Res> {
  __$$LaboratoryModelImplCopyWithImpl(
      _$LaboratoryModelImpl _value, $Res Function(_$LaboratoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? email = freezed,
    Object? operatingHours = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$LaboratoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      operatingHours: freezed == operatingHours
          ? _value._operatingHours
          : operatingHours // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LaboratoryModelImpl implements _LaboratoryModel {
  const _$LaboratoryModelImpl(
      {required this.id,
      required this.name,
      required this.address,
      @JsonKey(name: 'phone_number') required this.phoneNumber,
      this.email,
      @JsonKey(name: 'operating_hours')
      final Map<String, dynamic>? operatingHours,
      this.latitude,
      this.longitude,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _operatingHours = operatingHours;

  factory _$LaboratoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LaboratoryModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  final String? email;
  final Map<String, dynamic>? _operatingHours;
  @override
  @JsonKey(name: 'operating_hours')
  Map<String, dynamic>? get operatingHours {
    final value = _operatingHours;
    if (value == null) return null;
    if (_operatingHours is EqualUnmodifiableMapView) return _operatingHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'LaboratoryModel(id: $id, name: $name, address: $address, phoneNumber: $phoneNumber, email: $email, operatingHours: $operatingHours, latitude: $latitude, longitude: $longitude, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaboratoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._operatingHours, _operatingHours) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      phoneNumber,
      email,
      const DeepCollectionEquality().hash(_operatingHours),
      latitude,
      longitude,
      isActive,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LaboratoryModelImplCopyWith<_$LaboratoryModelImpl> get copyWith =>
      __$$LaboratoryModelImplCopyWithImpl<_$LaboratoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LaboratoryModelImplToJson(
      this,
    );
  }
}

abstract class _LaboratoryModel implements LaboratoryModel {
  const factory _LaboratoryModel(
          {required final String id,
          required final String name,
          required final String address,
          @JsonKey(name: 'phone_number') required final String phoneNumber,
          final String? email,
          @JsonKey(name: 'operating_hours')
          final Map<String, dynamic>? operatingHours,
          final double? latitude,
          final double? longitude,
          @JsonKey(name: 'is_active') required final bool isActive,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$LaboratoryModelImpl;

  factory _LaboratoryModel.fromJson(Map<String, dynamic> json) =
      _$LaboratoryModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override
  String? get email;
  @override
  @JsonKey(name: 'operating_hours')
  Map<String, dynamic>? get operatingHours;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$LaboratoryModelImplCopyWith<_$LaboratoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
