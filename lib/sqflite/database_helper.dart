import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_flutter/model/task_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Todo.db');

    var db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE tasks (
            id INTEGER PRIMARY KEY,
            title TEXT NOT NULL,
            description TEXT,
            date TEXT NOT NULL
          );

          CREATE TABLE shared_with (
            id INTEGER PRIMARY KEY,
            task_id INTEGER NOT NULL,
            friend_name TEXT NOT NULL,
            FOREIGN KEY (task_id) REFERENCES tasks (id)
          );
          
          CREATE TABLE tasksOnSuccesful (
          id INTEGER PRIMARY KEY,
          title TEXT NOT NULL,
          description TEXT,
          date TEXT NOT NULL
        );
        ''');
      },
    );

    return db;
  }

  Future<int> insertTask(Task task) async {
    var client = await db;
    return await client.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> insertSharedWith(int taskId, String friendName) async {
    var client = await db;
    return await client.insert(
      'shared_with',
      {
        'task_id': taskId,
        'friend_name': friendName,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Task>> getAllTasks() async {
    var client = await db;
    var tasks = await client.query('tasks');
    return tasks.map((taskMap) => Task.fromMap(taskMap)).toList();
  }

  Future<int> updateTask(Task task) async {
    var client = await db;
    return await client.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(int taskId) async {
    var client = await db;
    return await client.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [taskId],
    );
  }

  Future<int> insertTaskOnSuccessful(Task task) async {
    var client = await db;
    var taskId = await client.insert(
      'tasksOnSuccesful',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return taskId;
  }

  Future<int> countIncompleteTasks() async {
    final client = await db;
    final now = DateTime.now();
    final yesterday = now.subtract(Duration(days: 1));

    final count = Sqflite.firstIntValue(await client.rawQuery('''
    SELECT COUNT(*) 
    FROM tasks 
    WHERE date <= ? AND date >= ? 
      AND id NOT IN (SELECT task_id FROM tasksOnSuccesful)
  ''', [yesterday.toIso8601String(), yesterday.toIso8601String()]));

    return count ?? 0;
  }


  Future<int> countSuccessfulTasks() async {
    final client = await db;
    final count = Sqflite.firstIntValue(await client.rawQuery('SELECT COUNT(*) FROM tasksOnSuccesful'));
    return count ?? 0;
  }

// Add other CRUD operations as needed
}