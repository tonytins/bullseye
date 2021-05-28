import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:flutter/services.dart';
import 'package:bullseye/prompt.dart';
import 'package:bullseye/control.dart';
import 'package:bullseye/score.dart';
import 'package:bullseye/game_model.dart';

void main() => runApp(BullsEyeApp());

class BullsEyeApp extends StatelessWidget {
  Brightness currentBrightness = Brightness.light;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return PlatformApp(
        title: 'BullsEye',
        // For some reason text is black in dark mode on iOS
        cupertino: (_, __) => CupertinoAppData(
            theme: CupertinoThemeData(brightness: Brightness.light)),
        home: GamePage(title: 'BullsEye'));
  }
}

class GamePage extends StatefulWidget {
  GamePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _alertIsVisable = false;
  GameModel _model = GameModel(50);

  @override
  void initState() {
    super.initState();
    _model = GameModel(50);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Prompt(targetValue: _model.target),
            Control(model: _model),
            PlatformTextButton(
                child: PlatformText('Hit me!'),
                onPressed: () {
                  this._alertIsVisable = true;
                  _showAlert(context);
                }),
            Score(totalScore: _model.totalScore, round: _model.round)
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    Widget okButton = PlatformTextButton(
        child: PlatformText("Awesome!"),
        onPressed: () {
          Navigator.of(context).pop();
          this._alertIsVisable = false;
          print("Awesome Pressed! $_alertIsVisable");
        });

    showPlatformDialog(
        context: context,
        builder: (BuildContext context) {
          return PlatformAlertDialog(
            title: PlatformText("Hello There."),
            content: PlatformText("The slider's value is ${_model.current}"),
            actions: <Widget>[okButton],
          );
        });
  }
}
