
class PainLogs {
  final DateTime date;
  final int painLevel; // Scale from 0 to 10
  final String description;

  PainLogs({
    required this.date,
    required this.painLevel,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'painLevel': painLevel,
      'description': description,
    };
  }

  factory PainLogs.fromJson(Map<String, dynamic> json) {
    return PainLogs(
      date: DateTime.parse(json['date']),
      painLevel: json['painLevel'],
      description: json['description'],
    );
  }
}