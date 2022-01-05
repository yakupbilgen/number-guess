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

  int remainigGuess = 5;
  String hintText = "";
  String hintTextDescription = '';
  bool hintTextShow = false;

  int _totalCorrectGuess = 0;
  late String imageName;

  Random rnd = Random();
  late int myRandomNumber;

  @override
  void initState() {
    super.initState();
    generetRandomNumber();
  }

  void generetRandomNumber() {
    myRandomNumber = rnd.nextInt(101);
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
      body: Padding(
        padding: const EdgeInsets.only(
            left: AppSizeConstants.defaultSizedBoxLeftAndRightSpace,
            right: AppSizeConstants.defaultSizedBoxLeftAndRightSpace),
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
                  style: myTextStyle(24, Colors.black),
                )
              ],
            ),
            (hintTextShow)
                ? Column(
                    children: [
                      Text(
                        hintText,
                        style: myTextStyle(32, Colors.red),
                      ),
                      Text(
                        hintTextDescription,
                        style: myTextStyle(24, Colors.black),
                      ),
                    ],
                  )
                : const SizedBox(),
            TextField(
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
            SizedBox(
              height: 75,
              width: 150,
              child: ElevatedButton(
                onPressed: _buildGuessButtonMethod,
                child: Text(
                  AppTextContants.gameScreenGuessButton,
                  style: myTextStyle(24, Colors.black),
                ),
              ),
            ),
            // SizedBox(
            //   height: 75,
            //   width: 150,
            //   child: ElevatedButton(
            //     onPressed: _buildHintButtonMethod,
            //     child: Text(
            //       AppTextContants.gameScreenHintButton,
            //       style: myTextStyle(24, Colors.yellow),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  _buildGuessButtonMethod() {
    if (myTextController.text != "") {
      if (int.parse(myTextController.text) == myRandomNumber) {
        hintTextDescription = 'Correct guess. You have earned 5 more rights';
        remainigGuess += 5;
        _totalCorrectGuess++;
        generetRandomNumber();
      } else {
        (int.parse(myTextController.text) < myRandomNumber)
            ? hintTextDescription = 'Raise the guess.'
            : hintTextDescription = 'Reduce guess.';

        remainigGuess--;
        _remainingGuessZero();
      }
    } else {
      hintTextDescription = 'Answer is empty. Please entry answer!';
    }
    hintText = 'Hint';
    debugPrint(hintTextDescription);
    hintTextShow = true;
    setState(() {});
  }

  _remainingGuessZero() {
    if (remainigGuess <= 0) {
      (_totalCorrectGuess >= 3) ? imageName = 'smile' : imageName = 'sad';
      Navigator.pushNamed(context, 'resultscreen',
          arguments: {_totalCorrectGuess, imageName});
    }
  }
}
