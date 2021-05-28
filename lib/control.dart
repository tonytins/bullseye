import 'package:bullseye/game_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Control extends StatefulWidget {
  Control({Key? key, @required this.model}) : super(key: key);
  final GameModel? model;

  @override
  State<StatefulWidget> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  static const double PADDING = 45;

  @override
  Widget build(BuildContext context) {
    var currentValue = widget.model?.current;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(PADDING),
          child: PlatformText("1"),
        ),
        Expanded(
          child: PlatformSlider(
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
        Padding(
          padding: const EdgeInsets.all(PADDING),
          child: PlatformText("100"),
        )
      ],
    );
  }
}
