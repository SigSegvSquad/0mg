import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shop_app/models/User.dart';

class displayPic extends StatefulWidget {
  @override
  _displayPicState createState() => _displayPicState();
}

class _displayPicState extends State<displayPic> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> updateimage(@required imageUrl){
    return users.doc(FirebaseAuth.instance.currentUser.uid).update({'image': imageUrl}).then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
  String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: <Widget>[
          (image != null)? Image.network(image): CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_icon.png"),
          ),
          // CircleAvatar(
          //   // backgroundImage: AssetImage("assets/images/user_icon.png"),
          //
          // ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFF5F6F9),
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                onPressed: () => uploadImage(),
              ),
            ),
          )
        ],
      ),
    ));
  }

  uploadImage() async{
      final _storage = FirebaseStorage.instance;
      final _picker = ImagePicker();
      PickedFile image;

      await Permission.photos.request();

      var permissionStatus = await Permission.photos.status;

      if(permissionStatus.isGranted){
        image = await _picker.getImage(source: ImageSource.gallery);
        var file = File(image.path);

        if(image != null){
          var snapshot = await _storage.ref().child('Profile_Pictures/').putFile(file);

          var downloadUrl = await snapshot.ref.getDownloadURL();

          setState(() {
            imageUrl = downloadUrl;
            updateimage(imageUrl);
          });
        }else{
          print("No Path Received");
        }
      }else{
        print("Grant Permission and try again");
      }



  }
}
