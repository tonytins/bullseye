import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

bool get isDesktop =>
    (Platform.isLinux || Platform.isMacOS || Platform.isWindows);
bool get isMacWin => (Platform.isMacOS || Platform.isWindows);

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(),
        MaximizeWindowButton(),
        CloseWindowButton()
      ],
    );
  }
}
