import 'package:flutter/material.dart';
import 'package:shop_app/screens/sidebar/sidebar.dart';
import 'components/body.dart';

class SubscriptionScreen extends StatelessWidget {
  static String routeName = "/subscription";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subscription"),
      ),
      drawer: NavDrawer(),
      body: Body(),
    );
  }
}
