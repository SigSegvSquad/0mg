import 'package:flutter/material.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/subscription/subscription_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    void logout(){
      FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => (SignInScreen())
      ));
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 150,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end:
                  Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
                  colors: [
                    const Color(0xFF4A3298),
                    const Color(0xFF4A3298)
                  ]
                ),
                ),
              child:
              Align(
                alignment: Alignment.centerLeft,
              child:
              Container(
                margin: EdgeInsets.all(20),
                  child:Text(
                username,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )))),
            ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {Navigator.pushNamed(context, HomeScreen.routeName)},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.pushNamed(context, ProfileScreen.routeName)},
          ),
          ListTile(
            leading: Icon(Icons.access_time_rounded),
            title: Text('Subscription'),
            onTap: () => {Navigator.pushNamed(context, SubscriptionScreen.routeName)},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              logout()
            },
          ),
        ],
      ),
    );
  }
}