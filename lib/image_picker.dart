import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerapp extends StatefulWidget {
  ImagePickerapp({Key? key}) : super(key: key);

  @override
  _ImagePickerappState createState() => _ImagePickerappState();
}

class _ImagePickerappState extends State<ImagePickerapp> {
  XFile? file;
  ImagePicker? _picker = ImagePicker();
  List<XFile>? files;

  @override
  Widget build(BuildContext context) {
    Size devicesize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("image_picker"),
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: devicesize.height * 0.30,
                width: devicesize.width * 0.95,
                color: Colors.grey.shade200,
                child: Center(
                  child: file == null
                      ? Text('image not pic')
                      : Image.file(
                          File(file!.path),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final XFile? photo =
                        await _picker!.pickImage(source: ImageSource.gallery);
                    setState(() {
                      file = photo;
                    });
                    print("image picked");
                    print(photo!.path);
                  },
                  child: Text('gallery images')),
              ElevatedButton(
                  onPressed: () async {
                    final XFile? photo =
                        await _picker!.pickImage(source: ImageSource.camera);
                    setState(() {
                      file = photo;
                    });
                    print("image picked");
                    print(photo!.path);
                  },
                  child: Text('camera images')),
              ElevatedButton(
                  onPressed: () async {
                    final List<XFile>? photos = await _picker!.pickMultiImage();
                    setState(() {
                      files = photos;
                    });
                    print("image picked");
                    for (int i = 0; i < files!.length; i++) {
                      print(files![i].path);
                    }
                  },
                  child: Text('multiimages')),
            ],
          ),
        ),
      )),
    );
  }
}
