class DashboardStats {
  final int totalPatients;
  final int totalDoctors;
  final int totalServices;
  final int totalTests;
  final int totalLaboratories;
  final int totalNurses;
  final int totalRequests;
  final int pendingRequests;
  final int acceptedRequests;
  final int completedRequests;
  final int cancelledRequests;

  DashboardStats({
    required this.totalPatients,
    required this.totalDoctors,
    required this.totalServices,
    required this.totalTests,
    required this.totalLaboratories,
    required this.totalNurses,
    required this.totalRequests,
    required this.pendingRequests,
    required this.acceptedRequests,
    required this.completedRequests,
    required this.cancelledRequests,
  });

  factory DashboardStats.fromJson(Map<String, dynamic> json) {
    return DashboardStats(
      totalPatients: json['total_patients'] as int? ?? 0,
      totalDoctors: json['total_doctors'] as int? ?? 0,
      totalServices: json['total_services'] as int? ?? 0,
      totalTests: json['total_tests'] as int? ?? 0,
      totalLaboratories: json['total_laboratories'] as int? ?? 0,
      totalNurses: json['total_nurses'] as int? ?? 0,
      totalRequests: json['total_requests'] as int? ?? 0,
      pendingRequests: json['pending_requests'] as int? ?? 0,
      acceptedRequests: json['accepted_requests'] as int? ?? 0,
      completedRequests: json['completed_requests'] as int? ?? 0,
      cancelledRequests: json['cancelled_requests'] as int? ?? 0,
    );
  }
}

class DailyRequestStat {
  final DateTime requestDate;
  final int totalRequests;
  final int pendingCount;
  final int acceptedCount;
  final int completedCount;
  final int cancelledCount;

  DailyRequestStat({
    required this.requestDate,
    required this.totalRequests,
    required this.pendingCount,
    required this.acceptedCount,
    required this.completedCount,
    required this.cancelledCount,
  });

  factory DailyRequestStat.fromJson(Map<String, dynamic> json) {
    return DailyRequestStat(
      requestDate: DateTime.parse(json['request_date'] as String),
      totalRequests: json['total_requests'] as int? ?? 0,
      pendingCount: json['pending_count'] as int? ?? 0,
      acceptedCount: json['accepted_count'] as int? ?? 0,
      completedCount: json['completed_count'] as int? ?? 0,
      cancelledCount: json['cancelled_count'] as int? ?? 0,
    );
  }
}
