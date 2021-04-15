import 'package:flutter/material.dart';
import 'Product.dart';
import 'Order.dart';

class CartProduct {
  final Product product;
  int numOfItem;

  CartProduct({@required this.product, @required this.numOfItem});
}

List<CartProduct> yourCart = [
];

double getCheckoutPrice(){
  double priceTotal = 0;
  for(var i = 0; i < yourCart.length; i++){
    priceTotal += yourCart[i].numOfItem * yourCart[i].product.price;
  }
  return priceTotal;
}

void placeOrder(){

  var productQtyPair = {};

  for(var i = 0; i < yourCart.length; i++){
    productQtyPair[yourCart[i].product.id.toString()] = yourCart[i].numOfItem;
  }

  Order order = new Order(order: productQtyPair, price: getCheckoutPrice().toInt());

  order.registerOnDatabase();

  yourCart.clear();
}

void addToCart(Product product){
  for(var i = 0; i < yourCart.length; i++){
    if(yourCart[i].product.id == product.id){
      yourCart[i].numOfItem++;
      return;
    }
  }
  CartProduct cartProduct = CartProduct(product: product, numOfItem: 1);
  yourCart.add(cartProduct);
}

void removeFromCart(Product product){
  for(var i = 0; i < yourCart.length; i++){
    if(yourCart[i].product.id == product.id){
      if(yourCart[i].numOfItem > 0) {
        yourCart[i].numOfItem--;
      }
      else{
        yourCart.removeAt(i);
      }
    }
  }
}

int getNumItems(Product product){
  for(var i = 0; i < yourCart.length; i++){
    if(yourCart[i].product.id == product.id){
      return yourCart[i].numOfItem;
    }
  }
  return 0;
}
