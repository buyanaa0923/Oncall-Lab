class ScheduleUI {
  const ScheduleUI({
    required this.doctorName,
    required this.specialization,
    required this.status,
    required this.dateTime,
    required this.avatarUrl,
    required this.badgeColor,
  });

  final String doctorName;
  final String specialization;
  final String status;
  final DateTime dateTime;
  final String avatarUrl;
  final int badgeColor;
}
