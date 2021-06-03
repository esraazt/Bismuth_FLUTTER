import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'record copy.dart';

import 'FieldGeologist.dart';
import 'Leader.dart';
import 'package:Bismuth/globalV.dart' as globals;

class Task {
  String departmentName;
  String programName;
  String projectName;
  String taskName;
  String internalSupport;
  String externalSupport;
  String deliverables;
  String objectives;
  String summary;
  String taskID;

  Record record = new Record();
  Leader leader = new Leader();
  List<FieldGeologist> AssignedFieldGeologist = new List<FieldGeologist>();
  var report;

  Task(
      {this.departmentName,
      this.programName,
      this.projectName,
      @required this.taskName,
      this.objectives,
      this.summary,
      this.deliverables,
      this.externalSupport,
      this.internalSupport,
      this.taskID,
      this.record,
      this.leader,
      this.AssignedFieldGeologist,
      this.report});

  factory Task.AllfromJsonF(Map<String, dynamic> data) => new Task(
        taskName: data["taskName"],
        objectives: data["objectives"],
        summary: data["summary"],
        externalSupport: data["externalSupport"],
        deliverables: data["deliverables"],
        internalSupport: data["internalSupport"],
        departmentName: data["departmentName"],
        programName: data["programName"],
        projectName: data["projectName"],
        taskID: data["taskID"].toString(),
        leader: Leader.fromJson(data['leader']),
        AssignedFieldGeologist: new List<FieldGeologist>.from(
            data["AssignedFieldGeologist"]
                .map((x) => FieldGeologist.fromJson(x))),
        record: Record.fromJson(data['record']),
      );

  factory Task.UpcomingTasks(Map<String, dynamic> data) => new Task(
        taskName: data["taskName"],
        objectives: data["objectives"],
        summary: data["summary"],
        externalSupport: data["externalSupport"],
        deliverables: data["deliverables"],
        internalSupport: data["internalSupport"],
        departmentName: data["departmentName"],
        programName: data["programName"],
        projectName: data["projectName"],
        // leader = data["name"].toString(),
        taskID: data["taskID"].toString(),
        leader: Leader.fromJson(data['leader']),
        //fieldGeologists = data['fieldGeologists'];
        AssignedFieldGeologist: new List<FieldGeologist>.from(
            data["AssignedFieldGeologist"]
                .map((x) => FieldGeologist.fromJson(x))),
      );
  factory Task.fromJson(Map<String, dynamic> data) => new Task(
        taskName: data["taskName"],
        objectives: data["objectives"],
        summary: data["summary"],
        externalSupport: data["externalSupport"],
        deliverables: data["deliverables"],
        internalSupport: data["internalSupport"],
        departmentName: data["departmentName"],
        programName: data["programName"],
        projectName: data["projectName"],
        // leader = data["name"].toString(),
        taskID: data["taskID"].toString(),
        //fieldGeologists = data['fieldGeologists'];
      );

  Map<String, dynamic> toJson() {
    return {
      'taskName': taskName,
      'objectives': objectives,
      'summary': summary,
      'externalSupport': externalSupport,
      'deliverables': deliverables,
      'internalSupport': internalSupport,
      'departmentName': departmentName,
      'programName': programName,
      'projectName': projectName,
      'taskID': taskID,
      'AssignedFieldGeologist':
          new List<dynamic>.from(AssignedFieldGeologist.map((x) => x.toJson())),
      // change here to from globals...
      'leader': globals.leader.userID,
    };
  }

  Map<String, dynamic> editTask() {
    return {
      'taskName': taskName,
      'objectives': objectives,
      'summary': summary,
      'externalSupport': externalSupport,
      'deliverables': deliverables,
      'internalSupport': internalSupport,
      'departmentName': departmentName,
      'programName': programName,
      'projectName': projectName,
      'taskID': taskID,
      //'AssignedFieldGeologist':
      //    new List<dynamic>.from(AssignedFieldGeologist.map((x) => x.toJson())),
      // change here to from globals...
      // 'leader': globals.leader.userID,
    };
  }

  Map<String, dynamic> toEdit() {
    return {
      'taskName': taskName,
      'objectives': objectives,
      'summary': summary,
      'externalSupport': externalSupport,
      'deliverables': deliverables,
      'internalSupport': internalSupport,
      'departmentName': departmentName,
      'programName': programName,
      'projectName': projectName,
      'taskID': taskID,
      'AssignedFieldGeologist':
          new List<dynamic>.from(AssignedFieldGeologist.map((x) => x.toJson())),
      // change here to from globals...
      'leader': leader.userID,
    };
  }

  factory Task.GetAllLeader(Map<String, dynamic> data) => new Task(
        taskName: data["taskName"],
        objectives: data["objectives"],
        summary: data["summary"],
        externalSupport: data["externalSupport"],
        deliverables: data["deliverables"],
        internalSupport: data["internalSupport"],
        departmentName: data["departmentName"],
        programName: data["programName"],
        projectName: data["projectName"],
        // leader = data["name"].toString(),
        taskID: data["taskID"].toString(),
        //fieldGeologists = data['fieldGeologists'];
        AssignedFieldGeologist: new List<FieldGeologist>.from(
            data["AssignedFieldGeologist"]
                .map((x) => FieldGeologist.fromJson(x))),
      );

  @override
  String toString() {
    return '${this.taskID}';
  }
}
