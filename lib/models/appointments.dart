class Appointments {
  final String id;
  final String userId;
  final DateTime appointmentDate;
  final String doctorName;
  final String notes;
  final String? appointmentType;
  final String? location;
  final String? time;

  Appointments({
    required this.id,
    required this.userId,
    required this.appointmentDate,
    required this.doctorName,
    required this.notes,
    this.appointmentType,
    this.location,
    this.time,
  });
}
