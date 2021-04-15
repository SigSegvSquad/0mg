import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/tutorial/tutorialAdditionals.dart';
import 'package:shop_app/models/OrderDetails.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/home/components/search_field.dart';
import 'package:shop_app/screens/home/components/seasonal_product.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'hot_bar.dart';
import 'popular_product.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (load == 1) {
      CollectionReference usersFBase =
          FirebaseFirestore.instance.collection('users');
      CollectionReference ordersFBase =
          FirebaseFirestore.instance.collection('orders');

      usersFBase
          .doc(userId)
          .get()
          .then((value) => {
                ordersArr = value.data()["orderIds"],
              })
          .then((value) => {
                for (int i = 0; i < ordersArr.length; i++)
                  {
                    ordersFBase.doc(ordersArr[i]).get().then((value) => {
                          myOrders.add(new OrderDetails(
                              value.id,
                              value.data()["userDetails"],
                              value.data()["order"],
                              value.data()["orderStatus"],
                              value.data()["amount"],
                              value.data()["date"]))
                        })
                  },
              });
      load = 0;
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            SearchField(
              key: TutorialAdditionals.searchKey,
            ),
            SizedBox(height: getProportionateScreenWidth(5)),
            DiscountBanner(
              key: TutorialAdditionals.bannerKey,
            ),
            HotBar(key: TutorialAdditionals.hotBarKey),
            SizedBox(height: getProportionateScreenWidth(20)),
            Categories(
              key: TutorialAdditionals.categoriesKey,
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(key: TutorialAdditionals.popularProductsKey),
            SizedBox(height: getProportionateScreenWidth(30)),
            SeasonalProducts()
          ],
        ),
      ),
    );
  }
}
