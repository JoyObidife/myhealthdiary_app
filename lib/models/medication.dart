class Medication {
  final String id;
  final String? medicationId;
  final String name;
  final String dosage;
  final String frequency;
  final String scheduleTime;
  final String statue;

  Medication({
    required this.id,
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.scheduleTime,
    required this.statue,
    this.medicationId,
  });
}
