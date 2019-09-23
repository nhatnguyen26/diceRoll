import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent[100],
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.blueAccent[100],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  DicePageState createState() {
    // TODO: implement createState
    return DicePageState();
  }
}

class DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 1;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: diceClick,
              child: Image.asset('images/dice$leftDice.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: diceClick,
              child: Image.asset('images/dice$rightDice.png'),
            ),
          ),
        ],
      ),
    );
  }

  void diceClick() {
    setState(() {
      leftDice = random.nextInt(6) + 1;
      rightDice = random.nextInt(6) + 1;
    });
  }
}
