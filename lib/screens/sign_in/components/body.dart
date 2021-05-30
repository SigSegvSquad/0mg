import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/components/no_account_text.dart';
import 'package:shop_app/components/socal_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/home/home_screen.dart';

import '../../../size_config.dart';
import 'sign_form.dart';

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

void addUserDeets() {
  FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .set({'name': "default", 'userEmail': "default", "phoneNumber" : "default", "location": "default"})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

void setUserDeets() {
  userId = FirebaseAuth.instance.currentUser.uid;
  print(userId);

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  users
      .doc(userId)
      .get()
      .then((value) => {
            username = value.data()["name"],
            userEmail = value.data()["email"],
            phoneNumber = value.data()["phone"],
            address = value.data()["location"],
            subscriptionOrderMap = value.data()["subscription"]
          })
      .catchError((error) => addUserDeets());

  getProductData();
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialTile(
                      icon: "assets/icons/google-icon.svg",
                      press: () {
                        signInWithGoogle().then((userCred) => {
                        setUserDeets(),
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()))
                      }
                      );
                        print('Login successful');
                      },
                    ),
                    SocialTile(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocialTile(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
