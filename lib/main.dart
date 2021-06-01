import 'dart:math';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:bullseye/desktop.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:bullseye/prompt.dart';
import 'package:bullseye/control.dart';
import 'package:bullseye/score.dart';
import 'package:bullseye/game_model.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

const gameTitle = "Bullseye";

void main() {
  runApp(BullsEyeApp());

  if (isDesktop) {
    doWhenWindowReady(() {
      final win = appWindow;
      final minSize = Size(600, 450);

      win.minSize = minSize;
      win.size = minSize;
      win.alignment = Alignment.center;
      win.title = gameTitle;

      win.show();
    });
  }
}

class BullsEyeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return PlatformApp(
        title: gameTitle,
        // debugShowCheckedModeBanner: false,
        home: GamePage(title: gameTitle));
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
  late GameModel _model;

  @override
  void initState() {
    super.initState();
    var rng = Random();
    _model = GameModel(rng.nextInt(100) + 1);
  }

  int _sliderValue() => _model.current;

  int _pointsForCurrentRound() {
    var maxScore = 100;
    var difference = (_model.target - _sliderValue()).abs();

    return maxScore - difference;
  }

  Widget gameContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Prompt(targetValue: _model.target),
        Control(model: _model),
        PlatformTextButton(
            child: PlatformText('Hit me!'),
            onPressed: () {
              _showAlert(context);
              this._alertIsVisable = true;
            })
      ],
    );
  }

  Widget mobileContainer() {
    return SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      gameContainer(),
      Score(totalScore: _model.totalScore, round: _model.round)
    ]));
  }

  Widget desktopContainer() {
    return Column(children: [
      Container(
          height: 50,
          child: WindowTitleBarBox(
              child: Row(
            children: [
              Expanded(
                  child: MoveWindow(
                      child: Score(
                          totalScore: _model.totalScore, round: _model.round)))
            ],
          ))),
      Expanded(child: gameContainer()),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (isDesktop)
          return desktopContainer();
        else
          return mobileContainer();
      }),
    );
  }

  void _showAlert(BuildContext context) {
    var okButton = PlatformTextButton(
        child: PlatformText("Awesome!"),
        onPressed: () {
          Navigator.of(context).pop();
          this._alertIsVisable = false;
          setState(() {
            _model.totalScore += _pointsForCurrentRound();
            var rng = Random();
            _model.target = rng.nextInt(100) + 1;
          });
        });

    showPlatformDialog(
        context: context,
        builder: (BuildContext context) {
          return PlatformAlertDialog(
            title: PlatformText("Hello There."),
            content: PlatformText("The slider's value is ${_sliderValue()}\n" +
                "You scored ${_pointsForCurrentRound()} points this round."),
            actions: <Widget>[okButton],
          );
        });
  }
}
