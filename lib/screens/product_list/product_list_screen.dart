import 'package:flutter/material.dart';
import 'components/body.dart';

class ProductListScreen extends StatelessWidget {
  static String routeName = "/product_list";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supplements'),
      ),
      body: Body(),
    );
  }
}
