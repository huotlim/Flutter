class Task {
  final String title;
  final String description;
  final DateTime date;
  final DateTime scheduledTime;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.date,
    required this.scheduledTime,
    this.isCompleted = false,
  });
  bool isForToday() {
    final today = DateTime.now();
    return date.year == today.year &&
        date.month == today.month &&
        date.day == today.day;
  }
}
