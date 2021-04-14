import 'package:flutter/material.dart';
import 'package:shop_app/models/User.dart';

class Body extends StatefulWidget {
  String category;

  Body();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myOrders.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Order #${index + 1}'),
          subtitle: Text('Total Price: ₹${myOrders[index].amount}'),
          trailing: Text('${myOrders[index].orderStatus}'),
          onTap: () => {},
        );
      },
    );
  }
}
