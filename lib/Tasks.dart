import 'package:flutter/foundation.dart';

// just a blue print to our code
class Tasks {
  final String dep;
  final String prog;
  final String proj;
  final String leader;
  final String tName;
  final String inter;
  final String exter;
  final String del;
  final String obj;
  final String sum;
  final String fg;
  String id;

  // final Function onTap;

  //final String date ;

  Tasks({
    this.dep,
    this.prog,
    this.proj,
    this.leader,
    @required this.tName,
    this.obj,
    this.sum,
    this.fg,
    this.del,
    this.exter,
    this.inter,
    this.id,

    //@required this.date,
  });

  Tasks.fromJson(Map<String, dynamic> data)
      : tName = data["taskName"],
        obj = data["objectives"],
        sum = data["summary"],
        exter = data["externalSupport"],
        del = data["deliverables"],
        inter = data["internalSupport"],
        dep = data["departmentName"],
        prog = data["programName"],
        proj = data["projectName"],
        leader = data["name"].toString(),
        id = data["taskID"].toString(),
        fg = data['fieldGeologists'];

  Map<String, dynamic> toJson() {
    return {
      'taskName': tName,
      'objectives': obj,
      'summary': sum,
      'externalSupport': exter,
      'deliverables': del,
      'internalSupport': inter,
      'departmentName': dep,
      'programName': prog,
      'projectName': proj,
      'leaderID': leader,
      'taskID': id,
    };
  }
}
