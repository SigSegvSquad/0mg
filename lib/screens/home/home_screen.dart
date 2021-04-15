import 'package:flutter/material.dart';
import 'package:shop_app/screens/sidebar/sidebar.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: new FancyFab(),
      drawer: NavDrawer(),
      body: Body(),
    );
  }
}
