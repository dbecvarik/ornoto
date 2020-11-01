import 'dart:ui';

import 'package:flutter/material.dart';

class WidgetSelector extends Dialog {
  final Function addWidgetCallback;

  WidgetSelector(this.addWidgetCallback);

  @override
  Dialog build(BuildContext context) {
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
              onPressed: addWidgetCallback,
              child: new Text('Textbox'),
            )
          ],
        ),
      ),
    );
  }
}
