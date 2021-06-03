import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

class load extends StatefulWidget {
  @override
  _loadState createState() => _loadState();
}

class _loadState extends State<load> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Color> animation;
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future startDownload() async {
    final url =
        'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_640_3MG.mp4';

    final request = Request('GET', Uri.parse(url));
    final response = await Client().send(request);
    final contentLength = response.contentLength;

    final file = await getFile('file.mp4');
    final bytes = <int>[];
    response.stream.listen(
      (newBytes) {
        bytes.addAll(newBytes);

        setState(() {
          progress = bytes.length / contentLength;
        });
      },
      onDone: () async {
        setState(() {
          progress = 1;
        });

        await file.writeAsBytes(bytes);
      },
      onError: print,
      cancelOnError: true,
    );
  }

  Future<File> getFile(String filename) async {
    final dir = await getApplicationDocumentsDirectory();

    return File('${dir.path}/$filename');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffffffff),
        actions: <Widget>[
          IconButton(
              alignment: Alignment.bottomLeft,
              //alignment: AlignmentDirectional.bottomEnd,
              color: Colors.indigo,
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: progress,
                    valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
                    strokeWidth: 10,
                    backgroundColor: Colors.grey,
                  ),
                  Center(child: buildProgress()),
                ],
              ),
            ),
            const SizedBox(height: 32),
            FloatingActionButton.extended(
              onPressed: () => startDownload(),
              label: Text('Start classifing'),
              //icon: Icon(Icons.file_download),
            ),
          ],
        ),
      ),
    );
  }

// % progress
  Widget buildProgress() {
    if (progress == 1) {
      return Icon(
        Icons.done,
        color: Colors.blueGrey,
        size: 56,
      );
    } else {
      return Text(
        '${(progress * 100).toStringAsFixed(1)}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
          fontSize: 24,
        ),
      );
    }
  }

  Widget buildHeader(String text) => Container(
        padding: EdgeInsets.only(bottom: 32),
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
}
