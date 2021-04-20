import 'package:flutter/material.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/tutorial/tutorialAdditionals.dart';
import 'package:shop_app/tutorial/tutorial.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatefulWidget {
  ColorDots({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;
  int numItems;

  @override
  State<StatefulWidget> createState() => _ColorDots();
}

class _ColorDots extends State<ColorDots> {
  @override
  Widget build(BuildContext context) {
    widget.numItems = getNumItems(widget.product, yourCart);
    if (!TutorialAdditionals.isTutorial) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            SizedBox(width: getProportionateScreenWidth(40)),
            Text(widget.numItems.toString()),
            Spacer(),
            RoundedIconBtn(
              icon: Icons.remove,
              press: () {
                removeFromCart(widget.product, yourCart);
                setState(() {
                  widget.numItems -= 1;
                });
              },
            ),
            SizedBox(width: getProportionateScreenWidth(20)),
            RoundedIconBtn(
              icon: Icons.add,
              showShadow: true,
              press: () {
                addToCart(widget.product, yourCart);
                setState(() {
                  widget.numItems += 1;
                });
              },
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            SizedBox(width: getProportionateScreenWidth(40)),
            Text(widget.numItems.toString()),
            Spacer(),
            RoundedIconBtn(
              icon: Icons.remove,
              press: () {
                removeFromCart(widget.product, yourCart);
                setState(() {
                  widget.numItems -= 1;
                });
              },
            ),
            SizedBox(width: getProportionateScreenWidth(20)),
            RoundedIconBtn(
              key: TutorialAdditionals.addProductKey,
              icon: Icons.add,
              showShadow: true,
              press: () {
                addToCart(widget.product, yourCart);
                setState(() {
                  widget.numItems += 1;
                });
                goBackToHome();
              },
            ),
          ],
        ),
      );
    }
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key key,
    @required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
