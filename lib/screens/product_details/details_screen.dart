import 'package:flutter/material.dart';
import 'package:shop_app/tutorial/tutorial.dart';
import 'package:shop_app/tutorial/tutorialAdditionals.dart';

import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    if(TutorialAdditionals.isTutorial) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        orderProduct();
      });
    }

    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: agrs.product.rating),
      body: Body(product: agrs.product),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
}
