import 'package:flutter/material.dart';

import 'components/body.dart';

class UserOrdersScreen extends StatelessWidget {
  String category;
  static String routeName = "/product_list";

  UserOrdersScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body: Body(),
    );
  }
}
