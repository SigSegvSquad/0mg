import 'dart:async';

import 'package:flutter/material.dart';
import 'package:highlighter_coachmark/highlighter_coachmark.dart';
import 'package:shop_app/tutorial/tutorialAdditionals.dart';

/*
Alright so this is a big ass file and you need to understand the flow,

the startTutorial function is called when the user presses on the option in the
sidebar or for a first time user. after that, the flow is:

startTutorial() => showSearchBar => showHotBar => showDiscountBanner =>
=> show PopularProducts => showSideBar => showDrawerOptions => startCartTutorial

the rest of the CartTutorial is when the user clicks on any Product when
orderProduct() is called with a callback after the product page is built
(exact function in lib/screens/product_details/details_screen.dart#13).

Then, goBackToHome() is called when the user clicks on the + button in a product
(here lib/screens/product_details/components/color_dots.dart#88).

Similar to orderProduct(), goToCart() and inCart() are called via callbacks once
the widget is created.

Total list of all files involved in Tutorials if you need it
(And may god be with you if you do, because you'll need the help)

Cart:
  - lib/screens/cart/components/body.dart

Home:
  - lib/screens/home/components/body.dart
  - lib/screens/home/components/home_header.dart
  - lib/screens/home/components/popular_product.dart
  - lib/screens/sidebar/sidebar.dart

ProductDetails:
  - lib/screens/product_details/components/color_dots.dart
  - lib/screens/product_details/components/custom_app_bar.dart
  - lib/screens/product_details/details_screen.dart

Actual Tutorial:
  - lib/tutorial/tutorial.dart
  - lib/tutorial/tutorialAdditionals.dart
*/
// Read this, You'll need it if you wanna fix this mess ^

void startTutorial() {
  print('Tutorial Begin');
  TutorialAdditionals.isTutorial = true;
  showSearchBar();
}

void showSearchBar() {
  CoachMark itemCoachMark = CoachMark();
  BuildContext currentContext = TutorialAdditionals.searchKey.currentContext;
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
  BuildContext currentContext = TutorialAdditionals.bannerKey.currentContext;
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
  BuildContext currentContext = TutorialAdditionals.hotBarKey.currentContext;
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
  BuildContext currentContext =
      TutorialAdditionals.categoriesKey.currentContext;
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
  BuildContext currentContext =
      TutorialAdditionals.popularProductsKey.currentContext;
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
  BuildContext currentContext =
      TutorialAdditionals.popularProductsKey.currentContext;
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
  BuildContext currentContext =
      TutorialAdditionals.popularProductsKey.currentContext;
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
  BuildContext currentContext =
      TutorialAdditionals.singleProductKey.currentContext;
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
      onClose: () => Timer(Duration(milliseconds: 50),
          () => {print('Tutorial.clickOnProduct finished')}));
}

void orderProduct() {
  CoachMark itemCoachMark = CoachMark();
  BuildContext currentContext =
      TutorialAdditionals.addProductKey.currentContext;
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
      onClose: () => Timer(Duration(milliseconds: 50),
          () => {print('Tutorials.addProduct finished')}));
}

void goBackToHome() {
  CoachMark itemCoachMark = CoachMark();
  BuildContext currentContext =
      TutorialAdditionals.exitProductKey.currentContext;
  String displayText = "Now we go back to home,\nClick here";
  RenderBox widgetRenderBox = currentContext.findRenderObject();

  Rect markRect =
      widgetRenderBox.localToGlobal(Offset.zero) & widgetRenderBox.size;
  markRect = Rect.fromCircle(
      center: markRect.center, radius: markRect.longestSide * 0.6);

  TutorialAdditionals.backHomeOrderedProduct = true;

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
      onClose: () => Timer(Duration(milliseconds: 50),
          () => {print('Tutorial.backToHome finished')}));
}

void goToCart() {
  TutorialAdditionals.backHomeOrderedProduct = false;
  TutorialAdditionals.inCart = true;

  CoachMark itemCoachMark = CoachMark();
  BuildContext currentContext = TutorialAdditionals.cartKey.currentContext;
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
      onClose: () => Timer(Duration(milliseconds: 50),
          () => {print("Tutorial.goToCart finished")}));
}

void inCart(BuildContext currentContext) {
  TutorialAdditionals.inCart = false;
  TutorialAdditionals.isTutorial = false;

  CoachMark itemCoachMark = CoachMark();
  String displayText =
      "And we end here,\n\nWhen Ordering, click on the Button saying 'Check Out'\n\n For now, swipe left on the Product and click Back";

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
              fontSize: 22.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
      ],
      duration: null,
      onClose: () => Timer(
          Duration(milliseconds: 50), () => {print('Tutorial finished')}));
}
