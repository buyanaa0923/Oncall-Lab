// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoctorProfileModel _$DoctorProfileModelFromJson(Map<String, dynamic> json) {
  return _DoctorProfileModel.fromJson(json);
}

/// @nodoc
mixin _$DoctorProfileModel {
  String get id => throw _privateConstructorUsedError;
  String? get profession => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_number')
  String get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'academic_degree')
  String? get academicDegree => throw _privateConstructorUsedError;
  @JsonKey(name: 'years_of_experience')
  int? get yearsOfExperience => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_experience_years')
  int? get workExperienceYears => throw _privateConstructorUsedError;
  @JsonKey(name: 'professional_development')
  String? get professionalDevelopment => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_url')
  String? get photoUrl => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_reviews')
  int get totalReviews => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_completed_requests')
  int get totalCompletedRequests => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  dynamic get certifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_areas')
  List<String>? get preferredAreas => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoctorProfileModelCopyWith<DoctorProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorProfileModelCopyWith<$Res> {
  factory $DoctorProfileModelCopyWith(
          DoctorProfileModel value, $Res Function(DoctorProfileModel) then) =
      _$DoctorProfileModelCopyWithImpl<$Res, DoctorProfileModel>;
  @useResult
  $Res call(
      {String id,
      String? profession,
      @JsonKey(name: 'license_number') String licenseNumber,
      @JsonKey(name: 'academic_degree') String? academicDegree,
      @JsonKey(name: 'years_of_experience') int? yearsOfExperience,
      @JsonKey(name: 'work_experience_years') int? workExperienceYears,
      @JsonKey(name: 'professional_development')
      String? professionalDevelopment,
      @JsonKey(name: 'photo_url') String? photoUrl,
      double rating,
      @JsonKey(name: 'total_reviews') int totalReviews,
      @JsonKey(name: 'total_completed_requests') int totalCompletedRequests,
      String? bio,
      dynamic certifications,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'preferred_areas') List<String>? preferredAreas,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$DoctorProfileModelCopyWithImpl<$Res, $Val extends DoctorProfileModel>
    implements $DoctorProfileModelCopyWith<$Res> {
  _$DoctorProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profession = freezed,
    Object? licenseNumber = null,
    Object? academicDegree = freezed,
    Object? yearsOfExperience = freezed,
    Object? workExperienceYears = freezed,
    Object? professionalDevelopment = freezed,
    Object? photoUrl = freezed,
    Object? rating = null,
    Object? totalReviews = null,
    Object? totalCompletedRequests = null,
    Object? bio = freezed,
    Object? certifications = freezed,
    Object? isAvailable = null,
    Object? preferredAreas = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      academicDegree: freezed == academicDegree
          ? _value.academicDegree
          : academicDegree // ignore: cast_nullable_to_non_nullable
              as String?,
      yearsOfExperience: freezed == yearsOfExperience
          ? _value.yearsOfExperience
          : yearsOfExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      workExperienceYears: freezed == workExperienceYears
          ? _value.workExperienceYears
          : workExperienceYears // ignore: cast_nullable_to_non_nullable
              as int?,
      professionalDevelopment: freezed == professionalDevelopment
          ? _value.professionalDevelopment
          : professionalDevelopment // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      totalReviews: null == totalReviews
          ? _value.totalReviews
          : totalReviews // ignore: cast_nullable_to_non_nullable
              as int,
      totalCompletedRequests: null == totalCompletedRequests
          ? _value.totalCompletedRequests
          : totalCompletedRequests // ignore: cast_nullable_to_non_nullable
              as int,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      certifications: freezed == certifications
          ? _value.certifications
          : certifications // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      preferredAreas: freezed == preferredAreas
          ? _value.preferredAreas
          : preferredAreas // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
abstract class _$$DoctorProfileModelImplCopyWith<$Res>
    implements $DoctorProfileModelCopyWith<$Res> {
  factory _$$DoctorProfileModelImplCopyWith(_$DoctorProfileModelImpl value,
          $Res Function(_$DoctorProfileModelImpl) then) =
      __$$DoctorProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? profession,
      @JsonKey(name: 'license_number') String licenseNumber,
      @JsonKey(name: 'academic_degree') String? academicDegree,
      @JsonKey(name: 'years_of_experience') int? yearsOfExperience,
      @JsonKey(name: 'work_experience_years') int? workExperienceYears,
      @JsonKey(name: 'professional_development')
      String? professionalDevelopment,
      @JsonKey(name: 'photo_url') String? photoUrl,
      double rating,
      @JsonKey(name: 'total_reviews') int totalReviews,
      @JsonKey(name: 'total_completed_requests') int totalCompletedRequests,
      String? bio,
      dynamic certifications,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'preferred_areas') List<String>? preferredAreas,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$DoctorProfileModelImplCopyWithImpl<$Res>
    extends _$DoctorProfileModelCopyWithImpl<$Res, _$DoctorProfileModelImpl>
    implements _$$DoctorProfileModelImplCopyWith<$Res> {
  __$$DoctorProfileModelImplCopyWithImpl(_$DoctorProfileModelImpl _value,
      $Res Function(_$DoctorProfileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profession = freezed,
    Object? licenseNumber = null,
    Object? academicDegree = freezed,
    Object? yearsOfExperience = freezed,
    Object? workExperienceYears = freezed,
    Object? professionalDevelopment = freezed,
    Object? photoUrl = freezed,
    Object? rating = null,
    Object? totalReviews = null,
    Object? totalCompletedRequests = null,
    Object? bio = freezed,
    Object? certifications = freezed,
    Object? isAvailable = null,
    Object? preferredAreas = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DoctorProfileModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      academicDegree: freezed == academicDegree
          ? _value.academicDegree
          : academicDegree // ignore: cast_nullable_to_non_nullable
              as String?,
      yearsOfExperience: freezed == yearsOfExperience
          ? _value.yearsOfExperience
          : yearsOfExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      workExperienceYears: freezed == workExperienceYears
          ? _value.workExperienceYears
          : workExperienceYears // ignore: cast_nullable_to_non_nullable
              as int?,
      professionalDevelopment: freezed == professionalDevelopment
          ? _value.professionalDevelopment
          : professionalDevelopment // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      totalReviews: null == totalReviews
          ? _value.totalReviews
          : totalReviews // ignore: cast_nullable_to_non_nullable
              as int,
      totalCompletedRequests: null == totalCompletedRequests
          ? _value.totalCompletedRequests
          : totalCompletedRequests // ignore: cast_nullable_to_non_nullable
              as int,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      certifications: freezed == certifications
          ? _value.certifications
          : certifications // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      preferredAreas: freezed == preferredAreas
          ? _value._preferredAreas
          : preferredAreas // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
class _$DoctorProfileModelImpl implements _DoctorProfileModel {
  const _$DoctorProfileModelImpl(
      {required this.id,
      this.profession,
      @JsonKey(name: 'license_number') required this.licenseNumber,
      @JsonKey(name: 'academic_degree') this.academicDegree,
      @JsonKey(name: 'years_of_experience') this.yearsOfExperience,
      @JsonKey(name: 'work_experience_years') this.workExperienceYears,
      @JsonKey(name: 'professional_development') this.professionalDevelopment,
      @JsonKey(name: 'photo_url') this.photoUrl,
      required this.rating,
      @JsonKey(name: 'total_reviews') required this.totalReviews,
      @JsonKey(name: 'total_completed_requests')
      required this.totalCompletedRequests,
      this.bio,
      this.certifications,
      @JsonKey(name: 'is_available') required this.isAvailable,
      @JsonKey(name: 'preferred_areas') final List<String>? preferredAreas,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _preferredAreas = preferredAreas;

  factory _$DoctorProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorProfileModelImplFromJson(json);

  @override
  final String id;
  @override
  final String? profession;
  @override
  @JsonKey(name: 'license_number')
  final String licenseNumber;
  @override
  @JsonKey(name: 'academic_degree')
  final String? academicDegree;
  @override
  @JsonKey(name: 'years_of_experience')
  final int? yearsOfExperience;
  @override
  @JsonKey(name: 'work_experience_years')
  final int? workExperienceYears;
  @override
  @JsonKey(name: 'professional_development')
  final String? professionalDevelopment;
  @override
  @JsonKey(name: 'photo_url')
  final String? photoUrl;
  @override
  final double rating;
  @override
  @JsonKey(name: 'total_reviews')
  final int totalReviews;
  @override
  @JsonKey(name: 'total_completed_requests')
  final int totalCompletedRequests;
  @override
  final String? bio;
  @override
  final dynamic certifications;
  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  final List<String>? _preferredAreas;
  @override
  @JsonKey(name: 'preferred_areas')
  List<String>? get preferredAreas {
    final value = _preferredAreas;
    if (value == null) return null;
    if (_preferredAreas is EqualUnmodifiableListView) return _preferredAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'DoctorProfileModel(id: $id, profession: $profession, licenseNumber: $licenseNumber, academicDegree: $academicDegree, yearsOfExperience: $yearsOfExperience, workExperienceYears: $workExperienceYears, professionalDevelopment: $professionalDevelopment, photoUrl: $photoUrl, rating: $rating, totalReviews: $totalReviews, totalCompletedRequests: $totalCompletedRequests, bio: $bio, certifications: $certifications, isAvailable: $isAvailable, preferredAreas: $preferredAreas, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorProfileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.academicDegree, academicDegree) ||
                other.academicDegree == academicDegree) &&
            (identical(other.yearsOfExperience, yearsOfExperience) ||
                other.yearsOfExperience == yearsOfExperience) &&
            (identical(other.workExperienceYears, workExperienceYears) ||
                other.workExperienceYears == workExperienceYears) &&
            (identical(
                    other.professionalDevelopment, professionalDevelopment) ||
                other.professionalDevelopment == professionalDevelopment) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.totalReviews, totalReviews) ||
                other.totalReviews == totalReviews) &&
            (identical(other.totalCompletedRequests, totalCompletedRequests) ||
                other.totalCompletedRequests == totalCompletedRequests) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality()
                .equals(other.certifications, certifications) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            const DeepCollectionEquality()
                .equals(other._preferredAreas, _preferredAreas) &&
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
      profession,
      licenseNumber,
      academicDegree,
      yearsOfExperience,
      workExperienceYears,
      professionalDevelopment,
      photoUrl,
      rating,
      totalReviews,
      totalCompletedRequests,
      bio,
      const DeepCollectionEquality().hash(certifications),
      isAvailable,
      const DeepCollectionEquality().hash(_preferredAreas),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorProfileModelImplCopyWith<_$DoctorProfileModelImpl> get copyWith =>
      __$$DoctorProfileModelImplCopyWithImpl<_$DoctorProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorProfileModelImplToJson(
      this,
    );
  }
}

abstract class _DoctorProfileModel implements DoctorProfileModel {
  const factory _DoctorProfileModel(
      {required final String id,
      final String? profession,
      @JsonKey(name: 'license_number') required final String licenseNumber,
      @JsonKey(name: 'academic_degree') final String? academicDegree,
      @JsonKey(name: 'years_of_experience') final int? yearsOfExperience,
      @JsonKey(name: 'work_experience_years') final int? workExperienceYears,
      @JsonKey(name: 'professional_development')
      final String? professionalDevelopment,
      @JsonKey(name: 'photo_url') final String? photoUrl,
      required final double rating,
      @JsonKey(name: 'total_reviews') required final int totalReviews,
      @JsonKey(name: 'total_completed_requests')
      required final int totalCompletedRequests,
      final String? bio,
      final dynamic certifications,
      @JsonKey(name: 'is_available') required final bool isAvailable,
      @JsonKey(name: 'preferred_areas') final List<String>? preferredAreas,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at')
      required final DateTime updatedAt}) = _$DoctorProfileModelImpl;

  factory _DoctorProfileModel.fromJson(Map<String, dynamic> json) =
      _$DoctorProfileModelImpl.fromJson;

  @override
  String get id;
  @override
  String? get profession;
  @override
  @JsonKey(name: 'license_number')
  String get licenseNumber;
  @override
  @JsonKey(name: 'academic_degree')
  String? get academicDegree;
  @override
  @JsonKey(name: 'years_of_experience')
  int? get yearsOfExperience;
  @override
  @JsonKey(name: 'work_experience_years')
  int? get workExperienceYears;
  @override
  @JsonKey(name: 'professional_development')
  String? get professionalDevelopment;
  @override
  @JsonKey(name: 'photo_url')
  String? get photoUrl;
  @override
  double get rating;
  @override
  @JsonKey(name: 'total_reviews')
  int get totalReviews;
  @override
  @JsonKey(name: 'total_completed_requests')
  int get totalCompletedRequests;
  @override
  String? get bio;
  @override
  dynamic get certifications;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  @JsonKey(name: 'preferred_areas')
  List<String>? get preferredAreas;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DoctorProfileModelImplCopyWith<_$DoctorProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
