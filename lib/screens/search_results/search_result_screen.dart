import 'package:flutter/material.dart';

import 'components/body.dart';

class SearchResultScreen extends StatelessWidget {
  String query;
  static String routeName = "/search_result";

  SearchResultScreen(this.query);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search results for $query..."),
      ),
      body: Body(query),
    );
  }
}
