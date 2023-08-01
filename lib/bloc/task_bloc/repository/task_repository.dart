import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:todo_flutter/model/task_model.dart';
import 'package:todo_flutter/config.dart';
import 'package:todo_flutter/shared_preferences.dart';

abstract class ContactPageRepository {
  Future<TaskModel> fetchDetails(
      String id, String title, String description, String sharedTo);
}

class ContactPageRepo extends ContactPageRepository {
  String baseUrl = Config.apiUrl;

  @override
  Future<TaskModel> fetchDetails(String id, String title,
      String description, String? sharedTo) async {
    final body = {
      "id": id,
      "title": title,
      "description": description,
      "sharedTo": sharedTo,
    };

    final encodedBody = jsonEncode(body);

    var token = await SharedPreferencesHelper.getUserToken();
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    print(body);
    final response = await http.post(
      Uri.parse('$baseUrl/community_messages'),
      headers: headers,
      body: encodedBody,
    );
    print(response.body);
    if (response.statusCode == 201) {
      return TaskModel.fromJson(response.body);
    } else {
      debugPrint("ERROR IN API CALL ${response.statusCode}");
      throw Exception(response.statusCode);
    }
  }
}
