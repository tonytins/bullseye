import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Control extends StatefulWidget {
  Control({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  double _currentValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlatformText("1"),
        PlatformSlider(
          value: _currentValue,
          onChanged: (newValue) {
            setState(() {
              _currentValue = newValue;
              print(_currentValue);
            });
          },
          min: 1.0,
          max: 100.0,
        ),
        PlatformText("100")
      ],
    );
  }
}
