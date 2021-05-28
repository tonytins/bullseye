import 'package:flutter/material.dart';

class Prompt extends StatelessWidget {
  Prompt({@required this.targetValue});
  final int? targetValue;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text("PUT THE BULLSEYE AS CLOSE YOU CAN TO"),
        Text("$targetValue")
      ],
    );
  }
}
