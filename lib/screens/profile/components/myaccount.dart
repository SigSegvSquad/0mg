import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shop_app/models/User.dart';
import 'profile_pic.dart';
import 'update_name.dart';
import 'update_phone.dart';
import 'update_address.dart';

class MyAccount extends StatelessWidget {
  void setUserDetails() {
    String userId = FirebaseAuth.instance.currentUser.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    users.doc(userId).get().then((value) => {username = value.data()["name"]});

    users
        .doc(userId)
        .get()
        .then((value) => {phoneNumber = value.data()["phone"]});

    users
        .doc(userId)
        .get()
        .then((value) => {address = value.data()["location"]});

    // String phone = mobileNo.toString();
    // print(phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile Details"),
        ),
        body: Center(
            child: Column(
          children: [
            ProfilePic(),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  child: Text(
                    "Name",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.all(20.0),
                ),
                Container(
                  child: Text(
                    username,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.all(20.0),
                  width: 250,
                ),
                ElevatedButton(
                  child: Icon(Icons.create),
                  onPressed: () {
                    showDialog(
                        context: context, builder: (context) => Update_name());
                  },
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  child: Text(
                    "Phone",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.all(20.0),
                ),
                Container(
                  child: Text(
                    phoneNumber,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.all(20.0),
                  width: 250,
                ),
                ElevatedButton(
                  child: Icon(Icons.create),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Update_phone()));
                  },
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  child: Text(
                    "Address",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.all(20.0),
                ),
                Container(
                  child: Text(
                    address,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  width: 230,
                ),
                ElevatedButton(
                  child: Icon(Icons.create),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Update_location()));
                  },
                )
              ],
            ),
          ],
        )));
  }
}