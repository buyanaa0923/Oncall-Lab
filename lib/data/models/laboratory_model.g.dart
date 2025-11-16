// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laboratory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LaboratoryModelImpl _$$LaboratoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LaboratoryModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String?,
      operatingHours: json['operating_hours'] as Map<String, dynamic>?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$LaboratoryModelImplToJson(
        _$LaboratoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'operating_hours': instance.operatingHours,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
