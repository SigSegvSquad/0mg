import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Container(
          height: 170.0,
          width: double.infinity,
          child: Carousel(
            images: [
              Image.asset(
                "assets/images/med.jpg",
                height: 170,
                width: double.infinity,
              ),
              Image.asset(
                "assets/images/med2.png",
                // height: 150,
                // width: double.infinity,
              ),
              Image.asset(
                "assets/images/med3.jpg",
                // height: 150,
                // width: double.infinity,
              )
            ],
            dotSize: 4.0,
            dotSpacing: 15.0,
            dotColor: Colors.purple,
            indicatorBgPadding: 5.0,
            dotBgColor: Colors.black54.withOpacity(0.2),
            borderRadius: true,
            radius: Radius.circular(20),
            moveIndicatorFromBottom: 180.0,
            noRadiusForIndicator: true,
          ),
        ));
  }
}
