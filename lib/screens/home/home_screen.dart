import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/helper/globals.dart';
import 'package:shop_app/helper/tutorial.dart';
import 'package:shop_app/screens/home/components/fab.dart';
import 'package:shop_app/screens/sidebar/sidebar.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    // if(Globals.backHomeOrderedProduct)
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {goToCart();});

    return Scaffold(
      // floatingActionButton: new FancyFab(),
      drawer: NavDrawer(),
      body: Body(),
    );
  }
}
