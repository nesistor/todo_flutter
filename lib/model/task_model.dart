class Task {
  final int id;
  final String title;
  final String description;
  final String date;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date,
    };
  }
}
