import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: supplementProductList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(supplementProductList[index].images[0],
          width: 40,),
          title: Text('${supplementProductList[index].title}'),
          subtitle: Text('${supplementProductList[index].description}'),
          trailing: Text('${supplementProductList[index].price}'),
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: supplementProductList[index]),
          ),
        );
      },
    );
  }
}
