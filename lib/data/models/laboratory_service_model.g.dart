// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laboratory_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LaboratoryServiceModelImpl _$$LaboratoryServiceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LaboratoryServiceModelImpl(
      id: json['id'] as String,
      laboratoryId: json['laboratory_id'] as String,
      serviceId: json['service_id'] as String,
      priceMnt: (json['price_mnt'] as num).toInt(),
      isAvailable: json['is_available'] as bool,
      estimatedDurationHours:
          (json['estimated_duration_hours'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      service: json['services'] == null
          ? null
          : ServiceModel.fromJson(json['services'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LaboratoryServiceModelImplToJson(
        _$LaboratoryServiceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'laboratory_id': instance.laboratoryId,
      'service_id': instance.serviceId,
      'price_mnt': instance.priceMnt,
      'is_available': instance.isAvailable,
      'estimated_duration_hours': instance.estimatedDurationHours,
      'notes': instance.notes,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'services': instance.service,
    };
