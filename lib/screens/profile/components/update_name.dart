import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shop_app/models/User.dart';

class Update_name extends StatelessWidget {
  createAlertDialog(BuildContext context){

    TextEditingController customController = TextEditingController();

    return AlertDialog(
      title: Text("Enter New Name"),
      content: TextField(
        controller: customController,
      ),
      actions: <Widget>[
        MaterialButton(
          elevation: 5.0,
          child: Text("Submit", style: TextStyle(fontWeight: FontWeight.bold),),
          onPressed: (){
            username = customController.text;
            updatename(username);
            Navigator.of(context).pop();
          },
          color: Colors.blue,
        )
      ],
    );
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');


  Future<void> updatename(@required customController){
    return users.doc(FirebaseAuth.instance.currentUser.uid).update({'name': customController}).then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
  @override
  Widget build(BuildContext context) {
    return createAlertDialog(context);
  }
}



