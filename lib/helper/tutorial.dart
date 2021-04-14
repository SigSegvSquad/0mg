import 'dart:async';

import 'package:flutter/material.dart';
import 'package:highlighter_coachmark/highlighter_coachmark.dart';
import 'package:shop_app/helper/globals.dart';

void startTutorial() {
  print('Tutorial Begin');
  Globals.isTutorial = true;
  showSearchBar();
}

void showSearchBar() {
  CoachMark itemCoachMark = CoachMark();
  BuildContext currentContext = Globals.searchKey.currentContext;
  RenderBox widgetRenderBox = currentContext.findRenderObject();
  String displayText = "This is the Search Bar";

  Rect markRect =
      widgetRenderBox.localToGlobal(Offset.zero) & widgetRenderBox.size;
  markRect = markRect.inflate(5.0);
  itemCoachMark.show(
      targetContext: currentContext,
      markRect: markRect,
      markShape: BoxShape.rectangle,
      children: [
        Center(
          child: Text(
            displayText,
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
      ],
      duration: null,
      onClose: () => Timer(Duration(milliseconds: 50),
          () => {print('Tutorial.searchBar finished'), showDiscountBanner()}));
}

void showDiscountBanner() {
  CoachMark itemCoachMark = CoachMark();
  BuildContext currentContext = Globals.bannerKey.currentContext;
  RenderBox widgetRenderBox = currentContext.findRenderObject();
  String displayText = "This is the Discount Banner";

  Rect markRect =
      widgetRenderBox.localToGlobal(Offset.zero) & widgetRenderBox.size;
  markRect = markRect.inflate(50.0);
  itemCoachMark.show(
      targetContext: currentContext,
      markRect: markRect,
      markShape: BoxShape.rectangle,
      children: [
        Center(
          child: Text(
            displayText,
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
      ],
      duration: null,
      onClose: () => Timer(Duration(milliseconds: 50),
          () => {print('Tutorial.discountBanner finished'), showHotBar()}));
}

void showHotBar() {
  CoachMark itemCoachMark = CoachMark();
  BuildContext currentContext = Globals.hotBarKey.currentContext;
  RenderBox widgetRenderBox = currentContext.findRenderObject();
  String displayText = "This is the Hot Bar";

  Rect markRect =
      widgetRenderBox.localToGlobal(Offset.zero) & widgetRenderBox.size;
  markRect = markRect.inflate(15.0);
  itemCoachMark.show(
      targetContext: currentContext,
      markRect: markRect,
      markShape: BoxShape.rectangle,
      children: [
        Positioned(
          top: markRect.bottom + 15.0,
          right: 5.0,
          child: Text(
            displayText,
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
      ],
      duration: null,
      onClose: () => Timer(Duration(milliseconds: 50),
          () => {print('Tutorial.hotBar finished'), showCategories()}));
}

void showCategories() {
  CoachMark itemCoachMark = CoachMark();
  BuildContext currentContext = Globals.categoriesKey.currentContext;
  RenderBox widgetRenderBox = currentContext.findRenderObject();
  String displayText = "This are the categories";

  Rect markRect =
      widgetRenderBox.localToGlobal(Offset.zero) & widgetRenderBox.size;
  markRect = markRect.inflate(40.0);
  itemCoachMark.show(
      targetContext: currentContext,
      markRect: markRect,
      markShape: BoxShape.rectangle,
      children: [
        Center(
          child: Text(
            displayText,
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
      ],
      duration: null,
      onClose: () => Timer(
          Duration(milliseconds: 50),
          () =>
              {print('Tutorial.categories finished'), showPopularProducts()}));
}

void showPopularProducts() {
  CoachMark itemCoachMark = CoachMark();
  BuildContext currentContext = Globals.popularProductsKey.currentContext;
  RenderBox widgetRenderBox = currentContext.findRenderObject();
  String displayText = "These are the currently Popular Products";

  Rect markRect =
      widgetRenderBox.localToGlobal(Offset.zero) & widgetRenderBox.size;
  markRect = markRect.inflate(35.0);
  itemCoachMark.show(
      targetContext: currentContext,
      markRect: markRect,
      markShape: BoxShape.rectangle,
      children: [
        Center(
          child: Text(
            displayText,
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
      ],
      duration: null,
      onClose: () => Timer(Duration(milliseconds: 50),
          () => {print('Tutorial.popularProducts finished'), showSideBar()}));
}

void showSideBar() {
  CoachMark itemCoachMark = CoachMark();
  BuildContext currentContext = Globals.popularProductsKey.currentContext;
  String displayText = "<- SideBar";

  Rect markRect =
      Rect.fromLTWH(0.0, 0.0, 2.0, MediaQuery.of(currentContext).size.height);

  itemCoachMark.show(
      targetContext: currentContext,
      markRect: markRect,
      markShape: BoxShape.rectangle,
      children: [
        Center(
          child: Text(
            displayText,
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
      ],
      duration: null,
      onClose: () => Timer(
          Duration(milliseconds: 50),
          () => {
                print('Tutorial.sidebar finished'),
                Scaffold.of(currentContext).openDrawer(),
                showDrawerOptions()
              }));
}

void showDrawerOptions() {
  CoachMark itemCoachMark = CoachMark();
  BuildContext currentContext = Globals.popularProductsKey.currentContext;
  String displayText =
      "This is the Side Bar, Use the options here for navigation and settings";

  Rect markRect =
      Rect.fromLTWH(0.0, 0.0, 0.0, MediaQuery.of(currentContext).size.height);

  itemCoachMark.show(
      targetContext: currentContext,
      markRect: markRect,
      markShape: BoxShape.rectangle,
      children: [
        Center(
          child: Text(
            displayText,
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
      ],
      duration: null,
      onClose: () => Timer(
          Duration(milliseconds: 50),
          () => {
                print('Tutorial.drawer finished'),
                Navigator.of(currentContext).pop(),
                startCartTutorial()
              }));
}

void startCartTutorial() {
  CoachMark itemCoachMark = CoachMark();
  BuildContext currentContext = Globals.singleProductKey.currentContext;
  String displayText = "Now lets try ordering a product,\nClick here";
  RenderBox widgetRenderBox = currentContext.findRenderObject();

  Rect markRect =
      widgetRenderBox.localToGlobal(Offset.zero) & widgetRenderBox.size;
  markRect = markRect.inflate(5.0);
  itemCoachMark.show(
      targetContext: currentContext,
      markRect: markRect,
      markShape: BoxShape.rectangle,
      children: [
        Center(
          child: Text(
            displayText,
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
      ],
      duration: null,
      onClose: () => Timer(Duration(milliseconds: 50), () => {print('Tutorial.clickOnProduct finished')}));
}

void orderProduct() {
  CoachMark itemCoachMark = CoachMark();
  BuildContext currentContext = Globals.addProductKey.currentContext;
  String displayText = "Now lets try ordering a product,\nClick here";
  RenderBox widgetRenderBox = currentContext.findRenderObject();

  Rect markRect =
      widgetRenderBox.localToGlobal(Offset.zero) & widgetRenderBox.size;
  markRect = Rect.fromCircle(
      center: markRect.center, radius: markRect.longestSide * 0.6);

  itemCoachMark.show(
      targetContext: currentContext,
      markRect: markRect,
      children: [
        Center(
          child: Text(
            displayText,
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
      ],
      duration: null,
      onClose: () => Timer(Duration(milliseconds: 50), () => {print('Tutorials.addProduct finished')}));
}

void goBackToHome() {
  CoachMark itemCoachMark = CoachMark();
  BuildContext currentContext = Globals.exitProductKey.currentContext;
  String displayText = "Now we go back to home,\nClick here";
  RenderBox widgetRenderBox = currentContext.findRenderObject();

  Rect markRect =
      widgetRenderBox.localToGlobal(Offset.zero) & widgetRenderBox.size;
  markRect = Rect.fromCircle(
      center: markRect.center, radius: markRect.longestSide * 0.6);

  Globals.backHomeOrderedProduct = true;

  itemCoachMark.show(
      targetContext: currentContext,
      markRect: markRect,
      children: [
        Center(
          child: Text(
            displayText,
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
      ],
      duration: null,
      onClose: () => Timer(Duration(milliseconds: 50), () => {print('Tutorial.backToHome finished')}));
}

void goToCart() {
  Globals.backHomeOrderedProduct = false;

  CoachMark itemCoachMark = CoachMark();
  BuildContext currentContext = Globals.cartKey.currentContext;
  String displayText = "Click here";
  RenderBox widgetRenderBox = currentContext.findRenderObject();

  Rect markRect =
      widgetRenderBox.localToGlobal(Offset.zero) & widgetRenderBox.size;
  markRect = Rect.fromCircle(
      center: markRect.center, radius: markRect.longestSide * 0.6);

  itemCoachMark.show(
      targetContext: currentContext,
      markRect: markRect,
      children: [
        Center(
          child: Text(
            displayText,
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
      ],
      duration: null,
      onClose: () => Timer(Duration(milliseconds: 50), () => {print("Tutorial.goToCart finished")}));
}
