import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home.dart';
import 'message.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MainViewController());
  }
}

class MainViewController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MainViewControllerState();
  }
}

class _MainViewControllerState extends State<MainViewController> {
  int _currentIndex;
  List<Widget> _viewControllers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = 0;
    _viewControllers = [new HomeViewController(), new MessageViewController(), new Scaffold()];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text('Home')),
          new BottomNavigationBarItem(icon: new Icon(Icons.message), title: new Text('Message')),
          new BottomNavigationBarItem(icon: new Icon(Icons.perm_identity), title: new Text('Profile')),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _viewControllers[_currentIndex],
    );
  }
}
