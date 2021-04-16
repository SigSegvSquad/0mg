import 'package:flutter/material.dart';
import 'package:shop_app/models/OrderDetails.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/user_orders/components/order_info.dart';

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
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                       OrderInfo(userOrders[index])))
          },
        );
      },
    );
  }
}

