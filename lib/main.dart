import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assests/newbackground.png"),
                  fit: BoxFit.cover)),
          child : DicePage(),
        ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 250,
          left: 75,
          child: Image.asset(
            'assests/dice$leftDiceNumber.png',
          ),
        ),
        Positioned(
          bottom: 250,
          left: 225,
          child: Image.asset(
            'assests/dice$rightDiceNumber.png',
          ),
        ),
        Positioned(
          top: 100,
          right: 90,
          child: Image.asset(
            'assests/diceeLogo.png',
          ),
        ),
        Positioned(
          bottom: 150,
          right: 150,
          child: FlatButton(
            minWidth: 100.0,
            height: 50.0,
            child: Text('Roll'),
            textColor:Colors.white,
            color: Colors.red[900],
            onPressed: () {
              changeDiceFace();
            },
          ),
        ),
      ],
    );
  }
}