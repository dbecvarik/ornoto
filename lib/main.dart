import 'package:flutter/material.dart';
import 'package:ornoto/widget/note.dart';

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

class Widgets {
  List<Widget> widgets = new List();

  Function refresh;

  Widgets(this.refresh);

  getWidgets() {
    return widgets;
  }

  addWidget(Widget widget) {
    print("Adding widget");
    print("Current widgets $widgets");
    widgets.add(widget);
    refresh();
  }

  removeWidget(Widget widget) {
    print("Removing widget");
    if (widgets.length > 1) {
      widgets.removeLast();
    }
  }
}

class _HomePageState extends State<HomePage> {
  var widgets;
  bool initialized = false;

  refresh() {
    print("Refreshing state");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (initialized == false) {
      widgets = new Widgets(this.refresh);
      widgets.addWidget(new NoteWidget(widgets));
      initialized = true;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets.getWidgets(),
          ),
        ));
  }
}
