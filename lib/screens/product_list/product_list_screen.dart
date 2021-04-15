import 'package:flutter/material.dart';

import 'components/body.dart';

class ProductListScreen extends StatelessWidget {
  String category;
  static String routeName = "/product_list";

  ProductListScreen({@required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Body(category: category),
    );
  }
}
