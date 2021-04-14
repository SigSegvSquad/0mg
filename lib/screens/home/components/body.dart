import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/search_field.dart';
import 'package:shop_app/screens/home/components/seasonal_product.dart';

import '../../../size_config.dart';
import 'hot_bar.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'categories.dart';

import 'package:shop_app/helper/globals.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            SearchField(key: Globals.searchKey,),
            SizedBox(height: getProportionateScreenWidth(5)),
            DiscountBanner(key: Globals.bannerKey,),
            HotBar(key: Globals.hotBarKey),
            SizedBox(height: getProportionateScreenWidth(20)),
            Categories(key: Globals.categoriesKey,),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(key: Globals.popularProductsKey),
            SizedBox(height: getProportionateScreenWidth(30)),
            SeasonalProducts()
          ],
        ),
      ),
    );
  }
}
