import 'package:flutter/material.dart';

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
        TextButton(
          child: Text("Start Over"),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("Score:"),
              Text("$totalScore"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("Round:"),
              Text("$round"),
            ],
          ),
        ),
        TextButton(
          child: Text("Info"),
          onPressed: () {},
        )
      ],
    );
  }
}
