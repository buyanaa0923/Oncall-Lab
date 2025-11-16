// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorServiceModelImpl _$$DoctorServiceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DoctorServiceModelImpl(
      id: json['id'] as String,
      doctorId: json['doctor_id'] as String,
      serviceId: json['service_id'] as String,
      isAvailable: json['is_available'] as bool,
      priceMnt: (json['price_mnt'] as num).toInt(),
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      service: json['services'] == null
          ? null
          : ServiceModel.fromJson(json['services'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DoctorServiceModelImplToJson(
        _$DoctorServiceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor_id': instance.doctorId,
      'service_id': instance.serviceId,
      'is_available': instance.isAvailable,
      'price_mnt': instance.priceMnt,
      'notes': instance.notes,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'services': instance.service,
    };
