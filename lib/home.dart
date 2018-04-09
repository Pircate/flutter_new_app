import 'package:flutter/material.dart';
import 'search.dart';

class HomeViewController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomeViewControllerState();
  }
}

class _HomeViewControllerState extends State<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: () {
            Navigator.of(context).push(
              new MaterialPageRoute(builder: (context) {
                return new SearchViewController();
              })
            );
          })
        ],
      ),
      body: new ListView.builder(itemBuilder: (context, index) {
        return new HomeListItem(
          index: index,
        );
      }),
    );
  }
}

class HomeListItem extends StatefulWidget {
  HomeListItem({this.index});

  int index = 0;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeListItemState(index: index);
  }
}

class HomeListItemState extends State<HomeListItem> {
  HomeListItemState({this.index});

  bool _selected = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Row(
        children: <Widget>[
          new Icon(Icons.person),
          new SizedBox(
            width: 15.0,
          ),
          new Text('Name $index')
        ],
        mainAxisSize: MainAxisSize.max,
      ),
      height: 60.0,
      padding: new EdgeInsets.all(15.0),
      decoration: new BoxDecoration(border: new Border.all(color: Colors.black26, width: 0.25)),
    );
  }
}
