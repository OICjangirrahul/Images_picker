
import 'package:firstapp/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'ImagePicker',
    //theme: ThemeData.light(),
    
    // home: Home()
    home: ImagePickerapp(),
  ));
}
