import 'package:flutter/material.dart';

class SearchViewController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SearchViewControllerState();
  }
}

class _SearchViewControllerState extends State<SearchViewController> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Chip(label: new TextField(), backgroundColor: Colors.black12),
        centerTitle: true,
        titleSpacing: 10.0,
      ),
    );
  }
}
