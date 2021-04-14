import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  String query;
  
  Body(this.query);
  
  @override
  _BodyState createState() => _BodyState(query);
}

class _BodyState extends State<Body> {

  String query;

  _BodyState(this.query);

  @override
  Widget build(BuildContext context) {
    List<Product> productList = allProducts;
    List<Product> searchResults = [];

    productList.forEach((product) {
      if(product.title.toLowerCase().contains(query.toLowerCase()))
        searchResults.add(product);
      print(product.title);
    });

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(searchResults[index].images[0],
          width: 40,),
          title: Text('${searchResults[index].title}'),
          subtitle: Text('${searchResults[index].description}'),
          trailing: Text('${searchResults[index].price}'),
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: searchResults[index]),
          ),
        );
      },
    );
  }
}
