import 'dart:convert';
import 'package:http/http.dart' as http;

import 'User.dart';
import 'Task.dart';

class FieldGeologist extends User {
// has one record, has multi tasks, one for upcoming, list of completed
// every task has one record
  FieldGeologist(
      {userID, name, email, jobType, this.completedTasks, this.currentTask})
      : super(
          userID: userID,
          name: name,
          email: email,
          jobType: jobType,
        );
  Task currentTask = new Task(taskName: null);
  List<Task> completedTasks = new List<Task>();

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

  Future<void> getAllCompletedTasks() async {
    // get all tasks information, except the images from S3
    final completed =
        await http.get('http://127.0.0.1:5000/${this.userID}/getCompleted');
    List<dynamic> data = json.decode(completed.body.toString());
    this.completedTasks = data.map((data) => Task.AllfromJsonF(data)).toList();
  }

  Future<void> getCurrentTask() async {
    final upcoming = await http
        .get('http://127.0.0.1:5000/${this.userID}/Upcoming/getUpcoming');
    if (upcoming.statusCode == 400) {
      this.currentTask = null;
    } else {
      Map data = json.decode(upcoming.body.toString());
      this.currentTask = Task.UpcomingTasks(data);
    }
  }

  Future<void> addRecord() async {
    print(this.currentTask.record.images[0].ImageType);
    final record = await http.post(
        'http://127.0.0.1:5000/${this.userID}/${this.currentTask.taskID}/submitRecord',
        body: json.encode(this.currentTask.record.toJSON()));

    final recordID = await http.get(
        'http://127.0.0.1:5000/${this.userID}/${this.currentTask.taskID}/submitRecord');
    Map theID = json.decode(recordID.body.toString());
    this.currentTask.record.recordID = theID['recordID'];

    this.completedTasks.add(this.currentTask);
  }

  factory FieldGeologist.fromJson(Map<String, dynamic> json) =>
      new FieldGeologist(
        userID: json["userID"],
        name: json["name"],
        email: json["email"],
        jobType: json["jobType"],
      );
}
