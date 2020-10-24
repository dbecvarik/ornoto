import 'package:flutter/material.dart';

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
      home: MyHomePage(title: "ORNOTO"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var center = TextAlign.center;
    var _textStyle = TextStyle(fontSize: 36.0);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              maxLines: null,
              minLines: 10,
              textAlign: center,
              style: _textStyle,
              controller: controller,
              onChanged: (text) {
                RegExp regexp =
                    new RegExp(r".*^/$", multiLine: true, dotAll: true);
                if (regexp.hasMatch(text.split("\n").last)) {
                  print('menu!!!');
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => widgetDialog);
                }
              },
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
