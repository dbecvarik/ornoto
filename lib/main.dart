import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widget/selector.dart';

void main() {
  runApp(Ornoto());
}

class Ornoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ornoto',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: "ORNOTO"),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> widgets = new List();
  var center = TextAlign.center;
  var _textStyle = TextStyle(fontSize: 36.0);

  RawKeyboardListener getTextWidget() {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (event) => handleKey(event),
      child: TextField(
        maxLines: null,
        minLines: 1,
        textAlign: center,
        style: _textStyle,
        onChanged: (text) {
          RegExp regexp = new RegExp(
            r".*^/$",
          );
          if (regexp.hasMatch(text)) {
            showDialog(
                context: context,
                builder: (BuildContext context) =>
                    new WidgetSelector(this.addWidget));
          }
        },
      ),
    );
  }

  getWidgets() {
    if (widgets.isEmpty) {
      widgets.add(getTextWidget());
    }
    return widgets;
  }

  addWidget() {
    print("Adding widget");
    widgets.add(getTextWidget());
    setState(() {});
  }

  handleKey(RawKeyEvent event) {
    if (event.isKeyPressed(LogicalKeyboardKey.enter) && event.isShiftPressed) {
      print("DEBUG: Shift Enter");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getWidgets()),
      ),
    );
  }
}
