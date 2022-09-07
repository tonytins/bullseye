import 'dart:math';
import 'package:bullseye/adaptive.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:bullseye/prompt.dart';
import 'package:bullseye/control.dart';
import 'package:bullseye/score.dart';
import 'package:bullseye/game_model.dart';

const gameTitle = "Bullseye";

void main() {
  runApp(BullsEyeApp());
}

class BullsEyeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return MaterialApp(
      title: gameTitle,
      // debugShowCheckedModeBanner: false,
      home: GamePage(), darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
    );
  }
}

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _alertIsVisible = false;
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
        TextButton(
            child: const Text('Hit me!'),
            onPressed: () {
              _showAlert(context);
              _alertIsVisible = true;
            })
      ],
    );
  }

  Widget mobileContainer(Score score) {
    return SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [gameContainer(), score]));
  }

  Widget tabletContainer(Score score) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(45.0),
        child: score,
      ),
      Expanded(child: gameContainer()),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var score = Score(totalScore: _model.totalScore, round: _model.round);

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (isMobile(context)) {
          return mobileContainer(score);
        } else {
          return tabletContainer(score);
        }
      }),
    );
  }

  void _showAlert(BuildContext context) {
    var okButton = TextButton(
        child: const Text("Awesome!"),
        onPressed: () {
          Navigator.of(context).pop();
          _alertIsVisible = false;
          setState(() {
            _model.totalScore += _pointsForCurrentRound();
            var rng = Random();
            _model.target = rng.nextInt(100) + 1;
          });
        });

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Hello There."),
            content: Text("The slider's value is ${_sliderValue()}\n" +
                "You scored ${_pointsForCurrentRound()} points this round."),
            actions: <Widget>[okButton],
          );
        });
  }
}
