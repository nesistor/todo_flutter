class Task {
  final int id;
  final String title;
  final String description;
  final DateTime date;
  final bool insuccess;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.insuccess
  });

  Task copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? date,
    bool? insuccess,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      insuccess: insuccess ?? this.insuccess
    );
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: DateTime.parse(map['date']),
      insuccess: map['insuccess'],
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
