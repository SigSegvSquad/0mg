import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/user_orders/user_orders_screen.dart';

import '../../../size_config.dart';

class HotBar extends StatelessWidget {
  GlobalKey key;
  HotBar({key: GlobalKey}){
    this.key = key;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Deals", "page": null},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill", "page": null},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Orders", "page": UserOrdersScreen()},
      {"icon": "assets/icons/Phone Orange.svg", "text": "Contact", "page": null},
      {"icon": "assets/icons/Discover.svg", "text": "More", "page": null},
    ];
    return Padding(
      key: key,
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => categories[index]["page"]));
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
