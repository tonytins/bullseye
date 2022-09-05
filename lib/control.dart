import 'package:bullseye/game_model.dart';
import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  Control({Key? key, @required this.model}) : super(key: key);
  final GameModel? model;

  @override
  State<StatefulWidget> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  static const double PADDING = 25;

  @override
  Widget build(BuildContext context) {
    var currentValue = widget.model?.current;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(PADDING),
          child: Text("1"),
        ),
        Expanded(
          child: Slider(
            value: currentValue!.toDouble(),
            onChanged: (newValue) {
              setState(() {
                widget.model!.current = newValue.toInt();
              });
            },
            min: 1.0,
            max: 100.0,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(PADDING),
          child: Text("100"),
        )
      ],
    );
  }
}
