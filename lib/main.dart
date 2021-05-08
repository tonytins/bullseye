import 'package:flutter/material.dart';

void main() => runApp(BullsEyeApp());

class BullsEyeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BullsEye',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamePage(title: 'BullsEye'),
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello World!",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green)),
            TextButton(
                child: Text('Hit me!'),
                onPressed: () {
                  this._alertIsVisable = true;
                  _showAlert(context);
                })
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    Widget okButton = TextButton(
        child: Text("Awesome!"),
        onPressed: () {
          Navigator.of(context).pop();
          this._alertIsVisable = false;
          print("Awesome Pressed! $_alertIsVisable");
        });

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Hello There."),
            content: Text("This is my first pop-up."),
            actions: <Widget>[okButton],
            elevation: 5,
          );
        });
  }
}