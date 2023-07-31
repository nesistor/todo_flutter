class Config {
  static String get apiUrl {
    return 'https://127.0.0.1/api';
  }
  static String get apiCreateTask {
    return "$apiUrl/tasks-service/create_task";
  }
  static String apiDeleteTask(id) {
    return "$apiUrl/tasks-service/delete_task/$id";
  }
  static String apiUpdateTask(id) {
    return "$apiUrl/tasks-service/udpate_task/$id";
  }
  static String get apiGetTasks {
    return "$apiUrl/tasks-service/get_tasks";
  }
}
