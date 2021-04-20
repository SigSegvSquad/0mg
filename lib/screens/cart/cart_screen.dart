import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/cart/components/add_to_subscription.dart';

import 'components/body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      // bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Your Cart",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "${yourCart.length} items",
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
          IconButton(icon: SvgPicture.asset("assets/icons/add.svg", color: Colors.black54,), onPressed:
          (){showDialog(context: context, builder: (BuildContext context){
            return AddToSubscription();
          });})
        ],
      )
    );
  }
}
