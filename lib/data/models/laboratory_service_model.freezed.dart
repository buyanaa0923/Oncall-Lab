// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'laboratory_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LaboratoryServiceModel _$LaboratoryServiceModelFromJson(
    Map<String, dynamic> json) {
  return _LaboratoryServiceModel.fromJson(json);
}

/// @nodoc
mixin _$LaboratoryServiceModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'laboratory_id')
  String get laboratoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_id')
  String get serviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_mnt')
  int get priceMnt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimated_duration_hours')
  int? get estimatedDurationHours => throw _privateConstructorUsedError;
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
  $LaboratoryServiceModelCopyWith<LaboratoryServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaboratoryServiceModelCopyWith<$Res> {
  factory $LaboratoryServiceModelCopyWith(LaboratoryServiceModel value,
          $Res Function(LaboratoryServiceModel) then) =
      _$LaboratoryServiceModelCopyWithImpl<$Res, LaboratoryServiceModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'laboratory_id') String laboratoryId,
      @JsonKey(name: 'service_id') String serviceId,
      @JsonKey(name: 'price_mnt') int priceMnt,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'estimated_duration_hours') int? estimatedDurationHours,
      String? notes,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'services') ServiceModel? service});

  $ServiceModelCopyWith<$Res>? get service;
}

/// @nodoc
class _$LaboratoryServiceModelCopyWithImpl<$Res,
        $Val extends LaboratoryServiceModel>
    implements $LaboratoryServiceModelCopyWith<$Res> {
  _$LaboratoryServiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? laboratoryId = null,
    Object? serviceId = null,
    Object? priceMnt = null,
    Object? isAvailable = null,
    Object? estimatedDurationHours = freezed,
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
      laboratoryId: null == laboratoryId
          ? _value.laboratoryId
          : laboratoryId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      priceMnt: null == priceMnt
          ? _value.priceMnt
          : priceMnt // ignore: cast_nullable_to_non_nullable
              as int,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      estimatedDurationHours: freezed == estimatedDurationHours
          ? _value.estimatedDurationHours
          : estimatedDurationHours // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$LaboratoryServiceModelImplCopyWith<$Res>
    implements $LaboratoryServiceModelCopyWith<$Res> {
  factory _$$LaboratoryServiceModelImplCopyWith(
          _$LaboratoryServiceModelImpl value,
          $Res Function(_$LaboratoryServiceModelImpl) then) =
      __$$LaboratoryServiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'laboratory_id') String laboratoryId,
      @JsonKey(name: 'service_id') String serviceId,
      @JsonKey(name: 'price_mnt') int priceMnt,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'estimated_duration_hours') int? estimatedDurationHours,
      String? notes,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'services') ServiceModel? service});

  @override
  $ServiceModelCopyWith<$Res>? get service;
}

/// @nodoc
class __$$LaboratoryServiceModelImplCopyWithImpl<$Res>
    extends _$LaboratoryServiceModelCopyWithImpl<$Res,
        _$LaboratoryServiceModelImpl>
    implements _$$LaboratoryServiceModelImplCopyWith<$Res> {
  __$$LaboratoryServiceModelImplCopyWithImpl(
      _$LaboratoryServiceModelImpl _value,
      $Res Function(_$LaboratoryServiceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? laboratoryId = null,
    Object? serviceId = null,
    Object? priceMnt = null,
    Object? isAvailable = null,
    Object? estimatedDurationHours = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? service = freezed,
  }) {
    return _then(_$LaboratoryServiceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      laboratoryId: null == laboratoryId
          ? _value.laboratoryId
          : laboratoryId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      priceMnt: null == priceMnt
          ? _value.priceMnt
          : priceMnt // ignore: cast_nullable_to_non_nullable
              as int,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      estimatedDurationHours: freezed == estimatedDurationHours
          ? _value.estimatedDurationHours
          : estimatedDurationHours // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$LaboratoryServiceModelImpl implements _LaboratoryServiceModel {
  const _$LaboratoryServiceModelImpl(
      {required this.id,
      @JsonKey(name: 'laboratory_id') required this.laboratoryId,
      @JsonKey(name: 'service_id') required this.serviceId,
      @JsonKey(name: 'price_mnt') required this.priceMnt,
      @JsonKey(name: 'is_available') required this.isAvailable,
      @JsonKey(name: 'estimated_duration_hours') this.estimatedDurationHours,
      this.notes,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'services') this.service});

  factory _$LaboratoryServiceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LaboratoryServiceModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'laboratory_id')
  final String laboratoryId;
  @override
  @JsonKey(name: 'service_id')
  final String serviceId;
  @override
  @JsonKey(name: 'price_mnt')
  final int priceMnt;
  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @override
  @JsonKey(name: 'estimated_duration_hours')
  final int? estimatedDurationHours;
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
    return 'LaboratoryServiceModel(id: $id, laboratoryId: $laboratoryId, serviceId: $serviceId, priceMnt: $priceMnt, isAvailable: $isAvailable, estimatedDurationHours: $estimatedDurationHours, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, service: $service)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaboratoryServiceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.laboratoryId, laboratoryId) ||
                other.laboratoryId == laboratoryId) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.priceMnt, priceMnt) ||
                other.priceMnt == priceMnt) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.estimatedDurationHours, estimatedDurationHours) ||
                other.estimatedDurationHours == estimatedDurationHours) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.service, service) || other.service == service));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      laboratoryId,
      serviceId,
      priceMnt,
      isAvailable,
      estimatedDurationHours,
      notes,
      createdAt,
      updatedAt,
      service);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LaboratoryServiceModelImplCopyWith<_$LaboratoryServiceModelImpl>
      get copyWith => __$$LaboratoryServiceModelImplCopyWithImpl<
          _$LaboratoryServiceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LaboratoryServiceModelImplToJson(
      this,
    );
  }
}

abstract class _LaboratoryServiceModel implements LaboratoryServiceModel {
  const factory _LaboratoryServiceModel(
          {required final String id,
          @JsonKey(name: 'laboratory_id') required final String laboratoryId,
          @JsonKey(name: 'service_id') required final String serviceId,
          @JsonKey(name: 'price_mnt') required final int priceMnt,
          @JsonKey(name: 'is_available') required final bool isAvailable,
          @JsonKey(name: 'estimated_duration_hours')
          final int? estimatedDurationHours,
          final String? notes,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt,
          @JsonKey(name: 'services') final ServiceModel? service}) =
      _$LaboratoryServiceModelImpl;

  factory _LaboratoryServiceModel.fromJson(Map<String, dynamic> json) =
      _$LaboratoryServiceModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'laboratory_id')
  String get laboratoryId;
  @override
  @JsonKey(name: 'service_id')
  String get serviceId;
  @override
  @JsonKey(name: 'price_mnt')
  int get priceMnt;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  @JsonKey(name: 'estimated_duration_hours')
  int? get estimatedDurationHours;
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
  _$$LaboratoryServiceModelImplCopyWith<_$LaboratoryServiceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
