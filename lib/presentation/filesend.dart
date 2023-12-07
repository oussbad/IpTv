import 'dart:io';

import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class FileSend extends StatefulWidget {
  const FileSend({Key? key}) : super(key: key);

  @override
  State<FileSend> createState() => _FileSendState();
}

class _FileSendState extends State<FileSend> {
  String? filepath;

  Future<void> getImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      final File fileForFirebase = File(file.path!);
      upload(fileForFirebase);
    } else {
      // User canceled the picker
    }
  }

  upload(File imageFile) async {
    // open a bytestream
    var stream = http.ByteStream(imageFile.openRead())..cast();
    // get file length
    var length = await imageFile.length();
    // string to uri
    var uri = Uri.parse("http://10.0.2.2:3000/upload/");

    // create multipart request
    var request = http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = http.MultipartFile('apple', stream, length,
        filename: basename(imageFile.path));
    Map<String, String> headers = {
      "Accept": "application/json",
    };
    request.headers.addAll(headers);
    request.files.add(multipartFile);
    var response = await request.send();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                getImage();
              },
              child: Text("Send File to Node.js Server"),
            ),
          ],
        ),
      ),
    );
  }
}
