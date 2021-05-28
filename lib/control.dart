import 'package:flutter/material.dart';

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
        Text("1"),
        Slider(
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
        Text("100")
      ],
    );
  }
}
