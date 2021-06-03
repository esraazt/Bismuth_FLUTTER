import 'dart:typed_data';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';

class Imagee {
  int imageID;
  // to get them from s3 ..
  Uint8List image;
  String imagePath;
  String ImageType;
  // to use it in the frontend..
  File RealImage;

  // to save them into s3 in the backend..
  // var image = new File('/Users/wedalattas/Desktop/wed.jpg').readAsBytesSync();
  // String img64 = base64Encode(image);
  String StringImage;

  Imagee(
      {this.image,
      this.imageID,
      this.ImageType,
      this.imagePath,
      this.RealImage,
      this.StringImage});

// in case if it from S3 ..
  Future<String> getRealImagePath() async {
    //Uint8List base64Decode(String source) => base64.decode(source);
    // Uint8List imagee = base64Decode(tasks[0].record.images[0].image);
    // it will return the temp path.
    List<String> words = this.imagePath.split("/");
    var tempDir = await getTemporaryDirectory();
    print(words[words.length - 1]);
    final file = await new File('${tempDir.path}/${words[words.length - 1]}')
        .writeAsBytesSync(this.image);
    return '${tempDir.path}/${words[words.length - 1]}';
  }

  Future<String> getRockType() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://127.0.0.1:5000/classifyImage"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'image',
        this.RealImage.readAsBytes().asStream(),
        this.RealImage.lengthSync(),
        filename: "filename.jpg",
        contentType: MediaType('image', 'jpg'),
      ),
    );
    request.headers.addAll(headers);
    print("request: " + request.toString());
    await request.send().then((value) => print(value));

    // getImage label.
    final recordID = await http.get("http://127.0.0.1:5000/classifyImage");
    Map type = jsonDecode(recordID.body.toString());
    this.ImageType = type['label'];
    return type['label'];
  }

  factory Imagee.fromJson(Map<String, dynamic> json) => new Imagee(
        image: base64.decode(json['image']),
        imageID: json["imageID"],
        ImageType: json["imageType"],
        imagePath: json['imagePath'],
        // try it..
        RealImage: File.fromRawPath(base64.decode(json['image'])),
      );

  Map<String, dynamic> toJson() => {
        // to send images with records
        "image": StringImage,
        // "RealImage":RealImage,
        "ImageType": ImageType,
      };
}
