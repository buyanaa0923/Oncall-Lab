class RequestModel {
  final String id;
  final String? patientName;
  final String? patientPhone;
  final String? doctorName;
  final String? doctorPhone;
  final String? laboratoryName;
  final String? serviceName;
  final String requestType;
  final String status;
  final DateTime scheduledDate;
  final String? scheduledTimeSlot;
  final int priceMnt;
  final DateTime createdAt;
  final DateTime updatedAt;

  RequestModel({
    required this.id,
    this.patientName,
    this.patientPhone,
    this.doctorName,
    this.doctorPhone,
    this.laboratoryName,
    this.serviceName,
    required this.requestType,
    required this.status,
    required this.scheduledDate,
    this.scheduledTimeSlot,
    required this.priceMnt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'] as String,
      patientName: json['patient_name'] as String?,
      patientPhone: json['patient_phone'] as String?,
      doctorName: json['doctor_name'] as String?,
      doctorPhone: json['doctor_phone'] as String?,
      laboratoryName: json['laboratory_name'] as String?,
      serviceName: json['service_name'] as String?,
      requestType: json['request_type'] as String,
      status: json['status'] as String,
      scheduledDate: DateTime.parse(json['scheduled_date'] as String),
      scheduledTimeSlot: json['scheduled_time_slot'] as String?,
      priceMnt: json['price_mnt'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }
}
