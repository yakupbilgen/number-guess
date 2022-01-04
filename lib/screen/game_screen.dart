import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/widgets/app_text_style.dart';
import '../constants/app_size_constants.dart';
import '../constants/app_text_contansts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  TextEditingController myTextController = TextEditingController();

  final int remainigGuess = 5;
  late int myRandomNumber;
  Random rnd = Random();

  @override
  void initState() {
    super.initState();
    generetRandomNumber();
  }

  void generetRandomNumber() {
    myRandomNumber = rnd.nextInt(100);
    debugPrint("Generated random number:" + myRandomNumber.toString());
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
            Text(
              AppTextContants.gameScreenNumberOfGuesses,
              style: myTextStyle(24, Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                controller: myTextController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: AppTextContants.gameScreenLabelText,
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

  _buildHintButtonMethod() {
    if (myTextController != null) {
      if (int.parse(myTextController.text) == myRandomNumber) {
        debugPrint("Dogru tahmin");
      } else {
        (int.parse(myTextController.text) < myRandomNumber)
            ? debugPrint('Tahmini yükseltmelisin')
            : debugPrint('Tahmini azaltmalisin');
      }
    }
  }
}
