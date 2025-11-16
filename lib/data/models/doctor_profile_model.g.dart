// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorProfileModelImpl _$$DoctorProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DoctorProfileModelImpl(
      id: json['id'] as String,
      profession: json['profession'] as String?,
      licenseNumber: json['license_number'] as String,
      academicDegree: json['academic_degree'] as String?,
      yearsOfExperience: (json['years_of_experience'] as num?)?.toInt(),
      workExperienceYears: (json['work_experience_years'] as num?)?.toInt(),
      professionalDevelopment: json['professional_development'] as String?,
      photoUrl: json['photo_url'] as String?,
      rating: (json['rating'] as num).toDouble(),
      totalReviews: (json['total_reviews'] as num).toInt(),
      totalCompletedRequests: (json['total_completed_requests'] as num).toInt(),
      bio: json['bio'] as String?,
      certifications: json['certifications'],
      isAvailable: json['is_available'] as bool,
      preferredAreas: (json['preferred_areas'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$DoctorProfileModelImplToJson(
        _$DoctorProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profession': instance.profession,
      'license_number': instance.licenseNumber,
      'academic_degree': instance.academicDegree,
      'years_of_experience': instance.yearsOfExperience,
      'work_experience_years': instance.workExperienceYears,
      'professional_development': instance.professionalDevelopment,
      'photo_url': instance.photoUrl,
      'rating': instance.rating,
      'total_reviews': instance.totalReviews,
      'total_completed_requests': instance.totalCompletedRequests,
      'bio': instance.bio,
      'certifications': instance.certifications,
      'is_available': instance.isAvailable,
      'preferred_areas': instance.preferredAreas,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
