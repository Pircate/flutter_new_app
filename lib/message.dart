import 'package:flutter/material.dart';

const String _name = 'GorXion';

class MessageViewController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MessageViewControllerState();
  }
}

class _MessageViewControllerState extends State<MessageViewController> {
  final TextEditingController _textController = new TextEditingController();
  final _messageItems = <MessageItem>[];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: new AppBar(
          title: new Text('Message'),
        ),
        body: new Column(
          children: <Widget>[
            new Flexible(
                child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (context, index) => _messageItems[index],
              itemCount: _messageItems.length,
            )),
            new Divider(
              height: 1.0,
            ),
            new Container(
              decoration: new BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextContainer(),
            )
          ],
        ));
  }

  Widget _buildTextContainer() {
    return new Container(
        margin: new EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
                child: new TextField(
              controller: _textController,
              decoration: new InputDecoration.collapsed(hintText: 'Send a message'),
              onSubmitted: (text) => _handleSubmitted(text),
            )),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child:
                  new IconButton(icon: new Icon(Icons.send), onPressed: () => _handleSubmitted(_textController.text)),
            )
          ],
        ));
  }

  void _handleSubmitted(String text) {
    if (text.isEmpty) {
      final simple = new AlertDialog(
        title: new Text('内容不能为空'),
      );
      showDialog(context: context, child: simple);
      return;
    }
    FocusScope.of(context).requestFocus(new FocusNode());
    _textController.clear();
    MessageItem item = new MessageItem(
      text: text,
//      animationController: new AnimationController(vsync: this, duration: new Duration(milliseconds: 700)),
    );
    setState(() {
      _messageItems.add(item);
    });
//    item.animationController.forward();
  }
}

class MessageItem extends StatelessWidget {
  MessageItem({this.text, this.animationController});
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                child: new Text(_name[0]),
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  _name,
                  style: Theme.of(context).textTheme.subhead,
                ),
                new Container(
                  margin: new EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                )
              ],
            )
          ],
        ));
  }
}
