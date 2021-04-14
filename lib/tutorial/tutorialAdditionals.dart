import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialAdditionals {
  static bool isTutorial = false;
  static bool backHomeOrderedProduct = false;
  static bool inCart = false;

  //homepage widget keys
  static GlobalKey bannerKey = GlobalKey();
  static GlobalKey searchKey = GlobalKey();
  static GlobalKey hotBarKey = GlobalKey();
  static GlobalKey categoriesKey = GlobalKey();
  static GlobalKey popularProductsKey = GlobalKey();
  static GlobalKey seasonalProductsKey = GlobalKey();

  //sidebar listTile keys
  static GlobalKey homeKey = GlobalKey();
  static GlobalKey settingsKey = GlobalKey();
  static GlobalKey subscriptionKey = GlobalKey();
  static GlobalKey tutorialKey = GlobalKey();
  static GlobalKey logoutKey = GlobalKey();

  //cart example keys
  static GlobalKey cartKey = GlobalKey();
  static GlobalKey singleProductKey = GlobalKey();
  static GlobalKey addProductKey = GlobalKey();
  static GlobalKey exitProductKey = GlobalKey();
  static GlobalKey orderButtonKey = GlobalKey();
}
