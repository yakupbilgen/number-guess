import 'dart:math';

import 'package:flutter/material.dart';
import 'package:numberguess/constants/widgets/app_text_style.dart';

import '../constants/app_size_constants.dart';
import '../constants/app_text_contansts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final int remainigGuess = 5;
  final int correctGuess = 0;
  late int myRandomNumber;
  Random rnd = Random();

  @override
  void initState() {
    super.initState();
    myRandomNumber = rnd.nextInt(100);
    print("Randommmmmmmmmmmmmm:" + myRandomNumber.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTextContants.appBarTitleGameScreen),
        centerTitle: true,
        elevation: AppSizeConstants.appBarElevationSize,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  AppTextContants.gameScreenRemainingGuess,
                  style: myTextStyle(32, Colors.red),
                ),
                Text(
                  remainigGuess.toString(),
                  style: myTextStyle(32, Colors.black),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  AppTextContants.gameScreenCorrectGuess,
                  style: myTextStyle(24, Colors.red),
                ),
                Text(
                  correctGuess.toString(),
                  style: myTextStyle(24, Colors.black),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Guess?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 75,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, "/resultscreen"),
                    child: Text(
                      AppTextContants.gameScreenGuessButton,
                      style: myTextStyle(24, Colors.indigo),
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: _buildHintButtonMethod,
                    child: Text(
                      AppTextContants.gameScreenHintButton,
                      style: myTextStyle(24, Colors.yellow),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildHintButtonMethod() {}
}
