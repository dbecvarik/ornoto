import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  @override
  Widget build(BuildContext context) {
    var center = TextAlign.center;
    var _textStyle = TextStyle(fontSize: 36.0);

    handleKey(RawKeyEvent event) {
      if (event.isKeyPressed(LogicalKeyboardKey.enter) &&
          event.isShiftPressed) {
        print("DEBUG: Shift Enter");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RawKeyboardListener(
              focusNode: FocusNode(),
              onKey: (event) => handleKey(event),
              child: TextField(
                maxLines: null,
                minLines: 10,
                textAlign: center,
                style: _textStyle,
                onChanged: (text) {
                  RegExp regexp = new RegExp(
                    r".*^/",
                  );
                  if (regexp.hasMatch(text)) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => widgetDialog);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Dialog widgetDialog = Dialog(
  child: Container(
    height: 300.0,
    width: 360.0,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Choose from Library',
            style: TextStyle(color: Colors.black, fontSize: 22.0),
          ),
        ),
      ],
    ),
  ),
);
