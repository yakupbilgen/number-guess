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
  final int inCorrectGuess = 0;

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
                Text(AppTextContants.gameScreenRemainingGuess,
                    style: myTextStyle(Colors.red)),
                Text(remainigGuess.toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(AppTextContants.gameScreenInCorrectGuess),
                    Text(correctGuess.toString()),
                  ],
                ),
                Column(
                  children: [
                    const Text(AppTextContants.gameScreenInCorrectGuess),
                    Text(inCorrectGuess.toString()),
                  ],
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
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, "/resultscreen"),
                  child: const Text('Result'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, "/homepage"),
                  child: const Text('New Game'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
