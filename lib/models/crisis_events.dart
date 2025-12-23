
class CrisisEvents {
  final DateTime date;
  final String description;
  final String severity; // e.g., "mild", "moderate", "severe"

  CrisisEvents({
    required this.date,
    required this.description,
    required this.severity,
  });

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'description': description,
      'severity': severity,
    };
  }

  factory CrisisEvents.fromJson(Map<String, dynamic> json) {
    return CrisisEvents(
      date: DateTime.parse(json['date']),
      description: json['description'],
      severity: json['severity'],
    );
  }
}