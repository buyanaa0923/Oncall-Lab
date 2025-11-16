// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoctorServiceModel _$DoctorServiceModelFromJson(Map<String, dynamic> json) {
  return _DoctorServiceModel.fromJson(json);
}

/// @nodoc
mixin _$DoctorServiceModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_id')
  String get serviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_mnt')
  int get priceMnt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt =>
      throw _privateConstructorUsedError; // Nested relationships
  @JsonKey(name: 'services')
  ServiceModel? get service => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoctorServiceModelCopyWith<DoctorServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorServiceModelCopyWith<$Res> {
  factory $DoctorServiceModelCopyWith(
          DoctorServiceModel value, $Res Function(DoctorServiceModel) then) =
      _$DoctorServiceModelCopyWithImpl<$Res, DoctorServiceModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'doctor_id') String doctorId,
      @JsonKey(name: 'service_id') String serviceId,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'price_mnt') int priceMnt,
      String? notes,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'services') ServiceModel? service});

  $ServiceModelCopyWith<$Res>? get service;
}

/// @nodoc
class _$DoctorServiceModelCopyWithImpl<$Res, $Val extends DoctorServiceModel>
    implements $DoctorServiceModelCopyWith<$Res> {
  _$DoctorServiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doctorId = null,
    Object? serviceId = null,
    Object? isAvailable = null,
    Object? priceMnt = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? service = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      priceMnt: null == priceMnt
          ? _value.priceMnt
          : priceMnt // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceModelCopyWith<$Res>? get service {
    if (_value.service == null) {
      return null;
    }

    return $ServiceModelCopyWith<$Res>(_value.service!, (value) {
      return _then(_value.copyWith(service: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DoctorServiceModelImplCopyWith<$Res>
    implements $DoctorServiceModelCopyWith<$Res> {
  factory _$$DoctorServiceModelImplCopyWith(_$DoctorServiceModelImpl value,
          $Res Function(_$DoctorServiceModelImpl) then) =
      __$$DoctorServiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'doctor_id') String doctorId,
      @JsonKey(name: 'service_id') String serviceId,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'price_mnt') int priceMnt,
      String? notes,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'services') ServiceModel? service});

  @override
  $ServiceModelCopyWith<$Res>? get service;
}

/// @nodoc
class __$$DoctorServiceModelImplCopyWithImpl<$Res>
    extends _$DoctorServiceModelCopyWithImpl<$Res, _$DoctorServiceModelImpl>
    implements _$$DoctorServiceModelImplCopyWith<$Res> {
  __$$DoctorServiceModelImplCopyWithImpl(_$DoctorServiceModelImpl _value,
      $Res Function(_$DoctorServiceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doctorId = null,
    Object? serviceId = null,
    Object? isAvailable = null,
    Object? priceMnt = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? service = freezed,
  }) {
    return _then(_$DoctorServiceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      priceMnt: null == priceMnt
          ? _value.priceMnt
          : priceMnt // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorServiceModelImpl implements _DoctorServiceModel {
  const _$DoctorServiceModelImpl(
      {required this.id,
      @JsonKey(name: 'doctor_id') required this.doctorId,
      @JsonKey(name: 'service_id') required this.serviceId,
      @JsonKey(name: 'is_available') required this.isAvailable,
      @JsonKey(name: 'price_mnt') required this.priceMnt,
      this.notes,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'services') this.service});

  factory _$DoctorServiceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorServiceModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'service_id')
  final String serviceId;
  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @override
  @JsonKey(name: 'price_mnt')
  final int priceMnt;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
// Nested relationships
  @override
  @JsonKey(name: 'services')
  final ServiceModel? service;

  @override
  String toString() {
    return 'DoctorServiceModel(id: $id, doctorId: $doctorId, serviceId: $serviceId, isAvailable: $isAvailable, priceMnt: $priceMnt, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, service: $service)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorServiceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.priceMnt, priceMnt) ||
                other.priceMnt == priceMnt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.service, service) || other.service == service));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, doctorId, serviceId,
      isAvailable, priceMnt, notes, createdAt, updatedAt, service);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorServiceModelImplCopyWith<_$DoctorServiceModelImpl> get copyWith =>
      __$$DoctorServiceModelImplCopyWithImpl<_$DoctorServiceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorServiceModelImplToJson(
      this,
    );
  }
}

abstract class _DoctorServiceModel implements DoctorServiceModel {
  const factory _DoctorServiceModel(
          {required final String id,
          @JsonKey(name: 'doctor_id') required final String doctorId,
          @JsonKey(name: 'service_id') required final String serviceId,
          @JsonKey(name: 'is_available') required final bool isAvailable,
          @JsonKey(name: 'price_mnt') required final int priceMnt,
          final String? notes,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt,
          @JsonKey(name: 'services') final ServiceModel? service}) =
      _$DoctorServiceModelImpl;

  factory _DoctorServiceModel.fromJson(Map<String, dynamic> json) =
      _$DoctorServiceModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'service_id')
  String get serviceId;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  @JsonKey(name: 'price_mnt')
  int get priceMnt;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override // Nested relationships
  @JsonKey(name: 'services')
  ServiceModel? get service;
  @override
  @JsonKey(ignore: true)
  _$$DoctorServiceModelImplCopyWith<_$DoctorServiceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
