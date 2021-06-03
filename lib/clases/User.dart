import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  int userID;
  String name;
  String password;
  String email;
  String jobType;
  String message;

  User(
      {this.userID,
      this.name,
      this.email,
      this.password,
      this.jobType,
      this.message});

  Map<String, dynamic> toJson() => {
        "userID": userID,
        "name": name,
        "email": email,
        "password": password,
        "jobType": jobType,
      };

  Map<String, dynamic> messageToJson() => {
        "message": message,
      };

  factory User.messageFromJson(Map<String, dynamic> json) => new User(
        message: json["message"],
      );

  factory User.fromJson(Map<String, dynamic> json) => new User(
        userID: json["recordID"],
        name: json["name"],
        password: json["password"],
        email: json["email"],
        jobType: json["jobType"],
      );

  Future<int> SignUp() async {
    //************* SET THE DATA ***************/
    String url = 'http://127.0.0.1:5000/SignUp';
    final response = await http.post(
      url,
      body: json.encode(
        {
          'name': this.name.toString(),
          'email': this.email.toString(),
          'password': this.password.toString(),
          'jobType': this.jobType.toString(),
        },
      ),
    );

    //************* GET THE DATA ***************/
    final response1 = await http.get(url);
    int i = response1.statusCode;
    if (i == 400) {
      Map userMap = jsonDecode(response1.body);
      this.message = userMap['message'];
    } else {
      Map userMap = jsonDecode(response1.body);
      this.userID = int.parse(userMap['userID']);
    }
    return i;
  }

  Future<int> login() async {
    const url = 'http://127.0.0.1:5000/Login';
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': this.email.toString(),
          'password': this.password.toString(),
        },
      ),
    );
    final response1 = await http.get(
      url,
    );

    //************* GET THE DATA ***************/
    int i = response1.statusCode;
    if (i == 400) {
      Map userMap = jsonDecode(response1.body);
      this.message = userMap['message'];
    } else {
      Map userMap = jsonDecode(response1.body.toString());
      this.jobType = userMap['jobType'];
      this.userID = int.parse(userMap['userID']);
    }
    return i;
  }
}
