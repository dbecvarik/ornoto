import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'selector.dart';

// ignore: must_be_immutable
class NoteWidget extends StatelessWidget {
  var widgets;
  bool _delete = false;

  NoteWidget(this.widgets);

  handleKey(RawKeyEvent event, bool _delete) {
    if (event.isKeyPressed(LogicalKeyboardKey.enter) && event.isShiftPressed) {
      print("DEBUG: Shift Enter");
    }
    print(_delete);
    if (event.isKeyPressed(LogicalKeyboardKey.backspace) && _delete) {
      print("Removing widget");
    }
  }

  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (event) => handleKey(event, _delete),
      child: TextField(
        maxLines: null,
        minLines: 1,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 36.0),
        onChanged: (text) {
          _delete = false;
          if (text.isEmpty) {
            _delete = true;
          }
          RegExp regexp = new RegExp(
            r".*^/$",
          );
          if (regexp.hasMatch(text)) {
            showDialog(
                context: context,
                builder: (BuildContext context) => new WidgetSelector(widgets));
          }
        },
      ),
    );
  }
}
