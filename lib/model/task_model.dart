class Task {
  final int id;
  final String title;
  final String description;
  final DateTime date;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  Task copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? date,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: DateTime.parse(map['date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
    };
  }
}
