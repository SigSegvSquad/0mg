import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/User.dart';

// ignore: camel_case_types

class Update_location extends StatelessWidget {
  createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return AlertDialog(
      title: Text("Enter New Address"),
      content: TextField(
        controller: customController,
      ),
      actions: <Widget>[
        MaterialButton(
          elevation: 5.0,
          child: Text(
            "Submit",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            address = customController.text;
            updateaddress(address);
            Navigator.of(context).pop();
          },
          color: Colors.blue,
        )
      ],
    );
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> updateaddress(@required customController) {
    return users
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({'location': customController})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return createAlertDialog(context);
  }
}
