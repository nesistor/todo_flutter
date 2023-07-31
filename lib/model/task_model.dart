import 'dart:convert';

class TaskModel {
  final String id;
  final String title;
  final String description;
  final String createdAt;
  final String sharedTo;

  TaskModel(this.id,
      this.title,
      this.description,
      this.createdAt,
      this.sharedTo,);

  TaskModel copyWith({
    String? ownedBy,
    String? message,
    String? createdAt,
    String? pendingLyric,
  }) {
    return TaskModel(
      id,
      ownedBy ?? this.title,
      message ?? this.description,
      createdAt ?? this.createdAt,
      pendingLyric ?? this.sharedTo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdAt': createdAt,
      'sharedTo': sharedTo,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      map['id'] ?? '',
      map['title'] ?? '',
      map['description'] ?? '',
      map['createdAt'] ?? '',
      map['sharedTo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ContactPageModel(id: $id, title: $title, description: $description, createdAt: $createdAt, sharedTo: $sharedTo)';
  }
}