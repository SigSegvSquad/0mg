import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/models/OrderDetails.dart';

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
    CollectionReference usersFbase = FirebaseFirestore.instance.collection('users');

    var userDetails = {
      "userId": userId,
      "username": username,
      "email": userEmail,
      "address": address,
      "phoneNumber": phoneNumber
    };


    orders.add({
      'order':order,
      'amount':price,
      'date':date,
      'userDetails': userDetails,
      'orderStatus': 'pending approval'
    }).
    then((value) =>{
      ordersArr.add(value.id),
      usersFbase.doc(userId).update({
        "orderIds": ordersArr
      }),
      myOrders.add(new OrderDetails(value.id, userDetails, order, 'pending approval', price, date))
    }).
    catchError((error) => print("Error while registration: $error"));
  }

}