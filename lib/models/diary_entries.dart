
class DiaryEntries {
  final String id;
  final String userId;
  final List<String> symptoms;
  final List<String> hydrationLevel;
  final String date;
  final DateTime mood;
  final List<String> painLevels;

  DiaryEntries({
    required this.id,
    required this.userId,
    required this.hydrationLevel,
    required this.date,
    required this.mood,
    required this.symptoms,
    required this.painLevels,
  });
}
