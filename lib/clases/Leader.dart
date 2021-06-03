import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:Bismuth/clases/FieldGeologist.dart';
import 'package:Bismuth/clases/Task.dart';
import 'User.dart';

// I need to do, add task, delete task, edit task, get avaliable field geologists ,getAll tasks depend on its status.

class Leader extends User {
  List<Task> CompletedTasks = new List<Task>();
  List<Task> UcomingTasks = new List<Task>();

  List<FieldGeologist> avaliableField = new List<FieldGeologist>();
  Leader({
    userID,
    name,
    email,
    jobType,
  }) : super(
          userID: userID,
          name: name,
          email: email,
          jobType: jobType,
        );
  void SetUser(User user) {
    this.userID = user.userID;
    this.email = user.email;
    this.jobType = user.jobType;
  }

  Future<void> logout() async {
    const url = 'http://127.0.0.1:5000/logout';
    final response1 = await http.get(
      url,
    );
  }

  int getFieldGeologistID() {
    return this.userID;
  }

  Future<String> exportReport(String taskID) async {
    var report = await http.MultipartRequest(
      'GET',
      Uri.parse(
          "http://127.0.0.1:5000/${this.userID.toString()}/$taskID/getReport"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    report.headers.addAll(headers);
    print("request: " + report.toString());
    Future<http.StreamedResponse> w = report.send();
    var reportBytes = await http.Response.fromStream(await w);
    var bytes = reportBytes.bodyBytes;
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path + '/$taskID.xlsx';
    var file2 = await File(tempDir.path + '/$taskID.xlsx')
        .writeAsBytes(reportBytes.bodyBytes);
    return tempPath;
    //in the place that needs to export OpenFile.open(the path);
  }

// not completed yet..
  Future<void> editTask(Task task) async {
    //var test = this.UcomingTasks.where((task) => (task.taskID == task.taskID));

    //Task task = test.first;
    var url = 'http://127.0.0.1:5000/${this.userID}/${task.taskID}/edit';
    final response = await http.post(
      url,
      body: json.encode(task.editTask()),
    );
  }

  Future<void> deleteTask(String taskID) async {
    var url = 'http://127.0.0.1:5000/${this.userID}/${taskID}/removeTask';
    final response = await http.post(url);
  }

  // To assign the field geologists, new task will enter to this methods that contains the
  // task information with the ids of the field geologists in it.

  Future<void> addTask(Task task) async {
    var url = 'http://127.0.0.1:5000/${this.userID}/addTask';
    final response = await http.post(
      url,
      body: json.encode(task.toJson()),
    );

    final response1 = await http.get(url);

    Map theID = json.decode(response1.body.toString());
    task.taskID = theID['taskID'];
    //this.UcomingTasks.add(task);
  }

  Future<void> getCompletedTasks() async {
    final completed = await http
        .get('http://127.0.0.1:5000/${this.userID}/Completed/getTasks');
    List<dynamic> data = json.decode(completed.body.toString());
    this.CompletedTasks = data.map((data) => Task.GetAllLeader(data)).toList();
  }

  Future<void> getUpcomingTasks() async {
    final completed = await http
        .get('http://127.0.0.1:5000/${this.userID}/Upcoming/getTasks');

    List<dynamic> data = json.decode(completed.body.toString());
    this.UcomingTasks = data.map((data) => Task.GetAllLeader(data)).toList();
  }

  Future<void> getAvailableFieldGeologists() async {
    final completed = await http.get(
        'http://127.0.0.1:5000/${this.userID}/getAvailableFieldGeologists');
    List<dynamic> data = json.decode(completed.body.toString());

    this.avaliableField =
        data.map((data) => FieldGeologist.fromJson(data)).toList();
  }

  factory Leader.fromJson(Map<String, dynamic> json) => new Leader(
        userID: json["userID"],
        name: json["name"],
        email: json["email"],
        jobType: json["jobType"],
      );

  Map<String, dynamic> toJson() => {
        "userID": userID,
      };
}
