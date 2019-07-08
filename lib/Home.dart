import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;
  Future getImage(bool isCam)async{
    File img;
    if (isCam) {
      img = await ImagePicker.pickImage(source: ImageSource.camera);
    }else{
      img = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
     _image=img; 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Access Cam Ad Gallary"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.insert_drive_file),
              onPressed: (){
                getImage(true);
              },
            ),
            SizedBox(height: 10.0,),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: (){
                getImage(false);
              },
            ),
            _image ==null ? Container():Image.file(_image,height: 300.0,width: 300.0,)
          ],
        ),
      ),
    );
  }
}