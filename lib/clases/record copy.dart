import 'Imagee.dart';

class RecLocation {
  final double latitude;
  final double longitude;

  const RecLocation({
    this.latitude,
    this.longitude,
  });
}

class Record {
  int recordID;
  double EC;
  double EH;
  String city;
  String date;
  double pH;
  String remark;
  String siteName;
  String stream;
  double temp;
  double latitude;
  double longitude;
  List<Imagee> images = new List<Imagee>();

  Record(
      {this.recordID,
      this.EC,
      this.EH,
      this.city,
      this.date,
      this.pH,
      this.remark,
      this.siteName,
      this.stream,
      this.temp,
      this.latitude,
      this.longitude,
      this.images});

  factory Record.fromJson(Map<String, dynamic> json) => new Record(
        recordID: json["recordID"],
        images: new List<Imagee>.from(
            json["images"].map((x) => Imagee.fromJson(x))),
        EC: json["EC"],
        EH: json["EH"],
        city: json["city"],
        date: json["date"],
        pH: json["pH"],
        remark: json["remark"],
        siteName: json["siteName"],
        stream: json["stream"],
        temp: json["temp"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJSON() => {
        "EC": EC,
        "EH": EH,
        "city": city,
        "date": date,
        "pH": pH,
        "remark": remark,
        "siteName": siteName,
        "stream": stream,
        "temp": temp,
        "latitude": latitude,
        "Images": new List<dynamic>.from(images.map((x) => x.toJson())),
        "longitude": longitude,
      };
}

// get All images needed.
