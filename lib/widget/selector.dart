import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ornoto/widget/note.dart';

// ignore: must_be_immutable
class WidgetSelector extends Dialog {
  var widgets;

  WidgetSelector(this.widgets);

  @override
  Widget build(BuildContext context) {
    return new Dialog(
      child: Container(
        height: 300.0,
        width: 360.0,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'Choose from Library',
              style: TextStyle(color: Colors.black, fontSize: 22.0),
            ),
            FlatButton(
              onPressed: () => {widgets.addWidget(new NoteWidget(widgets))},
              child: new Text('Textbox'),
            )
          ],
        ),
      ),
    );
  }
}
