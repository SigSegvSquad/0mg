import 'package:flutter/material.dart';
import 'package:shop_app/models/OrderDetails.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/product_details/details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  String category;
  
  Body();
  
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {



  @override
  Widget build(BuildContext context) {
    List<OrderDetails> userOrders = myOrders.reversed.toList();
    return ListView.builder(
      itemCount: userOrders.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Order #${index+1}'),
          subtitle: Text('Total Price: ₹${userOrders[index].amount}'),
          trailing: Text('${userOrders[index].orderStatus}'),
          onTap: () => {},
        );
      },
    );
  }
}

