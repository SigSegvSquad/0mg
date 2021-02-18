import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Order{
  String orderId;
  var order;
  int price;
  String date;

  Order({
    @required this.order,
    @required this.price})
  {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String dateToday = formatter.format(now);

    this.date = dateToday;
  }

  void registerOnDatabase(){
    CollectionReference orders = FirebaseFirestore.instance.collection('orders');

    print(order);

    orders.add({
      'order':order,
      'amount':price,
      'date':date
    }).
    then((value) => print("Order registered")).
    catchError((error) => print("Error while registration: $error"));
  }

}