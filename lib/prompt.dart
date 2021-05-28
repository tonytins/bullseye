import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Prompt extends StatelessWidget {
  Prompt({@required this.targetValue});
  final int? targetValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PlatformText("PUT THE BULLSEYE AS CLOSE YOU CAN TO"),
        PlatformText("$targetValue")
      ],
    );
  }
}
