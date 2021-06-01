import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Order.dart';
import 'Product.dart';
import 'User.dart';

class CartProduct {
  final Product product;
  int numOfItem;

  CartProduct({@required this.product, @required this.numOfItem});
}

List<CartProduct> yourCart = [];
List<CartProduct> subscriptionCart = [];

void updateSubscription() async{
  Map<String, int> subscriptionsMap = new Map<String, int>();

  subscriptionCart.forEach((element) {
    subscriptionsMap[element.product.id] = element.numOfItem;
  });

  CollectionReference usersFbase = FirebaseFirestore.instance.collection('users');
  await usersFbase.doc(userId).update({
    'subscription': subscriptionsMap
  });
}

double getCheckoutPrice(List<CartProduct> yourCart) {
  double priceTotal = 0;
  for (var i = 0; i < yourCart.length; i++) {
    priceTotal += yourCart[i].numOfItem * yourCart[i].product.price;
  }
  return priceTotal.toInt().toDouble();
}

void placeOrder(List<CartProduct> yourCart) {
  var productQtyPair = {};

  for (var i = 0; i < yourCart.length; i++) {
    productQtyPair[yourCart[i].product.id.toString()] = yourCart[i].numOfItem;
  }

  Order order =
      new Order(order: productQtyPair, price: getCheckoutPrice(yourCart).toInt());

  order.registerOnDatabase();

  yourCart.clear();
}

void addToCart(Product product, List<CartProduct> yourCart) {
  for (var i = 0; i < yourCart.length; i++) {
    if (yourCart[i].product.id == product.id) {
      yourCart[i].numOfItem++;
      return;
    }
  }
  CartProduct cartProduct = CartProduct(product: product, numOfItem: 1);
  yourCart.add(cartProduct);
}

void removeFromCart(Product product, List<CartProduct> yourCart) {
  for (var i = 0; i < yourCart.length; i++) {
    if (yourCart[i].product.id == product.id) {
      if (yourCart[i].numOfItem > 0) {
        yourCart[i].numOfItem--;
      } else {
        yourCart.removeAt(i);
      }
    }
  }
}

int getNumItems(Product product, List<CartProduct> yourCart) {
  for (var i = 0; i < yourCart.length; i++) {
    if (yourCart[i].product.id == product.id) {
      return yourCart[i].numOfItem;
    }
  }
  return 0;
}
