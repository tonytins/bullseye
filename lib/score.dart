import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Score extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PlatformButton(
          child: PlatformText("Start Over"),
          onPressed: () {},
        ),
        PlatformText("Score:"),
        PlatformText("999"),
        PlatformText("Round:"),
        PlatformText("999"),
        PlatformButton(
          child: PlatformText("Info"),
          onPressed: () {},
        )
      ],
    );
  }
}
