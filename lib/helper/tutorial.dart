import 'dart:async';

import 'package:flutter/material.dart';
import 'package:highlighter_coachmark/highlighter_coachmark.dart';
import 'package:shop_app/helper/globals.dart';

void startTutorial() {
  print('Tutorial Begin');
  showSearchBar();
}

void showSearchBar() {
  CoachMark searchBarCoach = CoachMark();
  BuildContext currentContext = Globals.searchKey.currentContext;
  RenderBox searchBar = currentContext.findRenderObject();
  String displayText = "This is the SearchBar";

  Rect markRect = searchBar.localToGlobal(Offset.zero) & searchBar.size;
  markRect = markRect.inflate(5.0);
  searchBarCoach.show(
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
          () => {print('Tutorial.searchBar finished')}));
}
