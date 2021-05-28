import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Score extends StatelessWidget {
  Score({Key? key, @required this.totalScore, @required this.round})
      : super(key: key);

  final int? totalScore;
  final int? round;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlatformButton(
          child: PlatformText("Start Over"),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              PlatformText("Score:"),
              PlatformText("$totalScore"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              PlatformText("Round:"),
              PlatformText("$round"),
            ],
          ),
        ),
        PlatformButton(
          child: PlatformText("Info"),
          onPressed: () {},
        )
      ],
    );
  }
}
