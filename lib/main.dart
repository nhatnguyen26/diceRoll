import 'dart:math';

import 'package:flutter/material.dart';

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

class DicePageState extends State<DicePage>
    with SingleTickerProviderStateMixin {
  int leftDice = 1;
  int rightDice = 1;
  Random random = Random();

  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: diceClick,
              child: Image.asset('images/dice$leftDice.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: diceClick,
              child: Image.asset('images/dice$rightDice.png'),
            ),
          ),
        ],
      ),
    );
  }

  void diceClick() {
    animationController.reset();
    animationController.forward();
    animationController.addListener(() {
      setState(() {
        leftDice = random.nextInt(6) + 1;
        rightDice = random.nextInt(6) + 1;
      });
    });

  }
}
