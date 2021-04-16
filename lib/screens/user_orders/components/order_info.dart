import 'package:flutter/material.dart';
import 'package:shop_app/models/OrderDetails.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/product_details/details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../size_config.dart';


class OrderInfo extends StatefulWidget {
  OrderDetails thisOrder;

  OrderInfo(this.thisOrder);

  @override
  _OrderInfo createState() => _OrderInfo();
}

class _OrderInfo extends State<OrderInfo> {

  @override
  Widget build(BuildContext context) {

    String orderContentString ="";

    widget.thisOrder.orderContent.forEach((k,v){
      orderContentString += getProductById(k).title+"x"+v.toString()+"\n";
    });
    return Scaffold(
        appBar: AppBar(
        title: Text("Order Details")
        ),
      body: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
            child:SingleChildScrollView(
            child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(
                  "Order Id: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  widget.thisOrder.orderId,
                  style: TextStyle(fontSize: 18)
              )
            ],),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                "Order Content:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  orderContentString,
                  style: TextStyle(fontSize: 16)
              )
            ],),
            Row(children: [
              Text(
                "Total amount: ₹",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  widget.thisOrder.amount.toString(),
                  style: TextStyle(fontSize: 18)
              )
            ],),
            SizedBox(height: 20,),
            Row(children: [
              Text(
                "Order status: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  widget.thisOrder.orderStatus,
                  style: TextStyle(fontSize: 18)
              )
            ],)
          ],
        ))
        ),
      )
    );
  }
}

