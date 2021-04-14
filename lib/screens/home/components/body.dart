import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/search_field.dart';
import 'package:shop_app/screens/home/components/seasonal_product.dart';

import '../../../size_config.dart';
import 'hot_bar.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  var bannerKey = UniqueKey();
  var searchKey = UniqueKey();
  var hotBarKey = UniqueKey();
  var categoriesKey = UniqueKey();
  var popularProductsKey = UniqueKey();
  var seasonalProductsKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            SearchField(key: searchKey,),
            SizedBox(height: getProportionateScreenWidth(5)),
            DiscountBanner(key: bannerKey,),
            HotBar(key: hotBarKey),
            SizedBox(height: getProportionateScreenWidth(20)),
            Categories(key: categoriesKey,),
            PopularProducts(key: popularProductsKey),
            SizedBox(height: getProportionateScreenWidth(30)),
            SeasonalProducts()
          ],
        ),
      ),
    );
  }
}
