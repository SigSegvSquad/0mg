import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/product_details/details_screen.dart';

class Body extends StatefulWidget {
  String category;

  Body({@required this.category});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    List<Product> productList = getList(widget.category);
    return ListView.builder(
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(
            productList[index].images[0],
            width: 40,
          ),
          title: Text('${productList[index].title}'),
          subtitle: Text('${productList[index].description}'),
          trailing: Text('${productList[index].price}'),
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: productList[index]),
          ),
        );
      },
    );
  }
}

List<Product> getList(String category) {
  if (category.toLowerCase() == "lifestyle") {
    return lifestyleProductList;
  } else if (category.toLowerCase() == "general") {
    return tabletProductList;
  } else if (category.toLowerCase() == "supplements") {
    return supplementProductList;
  } else if (category.toLowerCase() == "surgery") {
    return surgeryProductList;
  } else if (category.toLowerCase() == "ayurveda") {
    return ayurvedaProductList;
  }else if (category.toLowerCase() == "other") {
    return otherProductList;
  }
}
