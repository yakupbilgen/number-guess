import 'package:flutter/material.dart';
import 'package:numberguess/constants/app_size_constants.dart';

import '../constants/app_text_contansts.dart';
import '../constants/widgets/app_text_style.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    Map? gameScreenData = ModalRoute.of(context)?.settings.arguments as Map;
    debugPrint('Result screen:\n');
    debugPrint(gameScreenData['totalCorrectGuess'].toString());
    debugPrint(gameScreenData['imageName']);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppSizeConstants.defaultSizedBoxLeftAndRightSpace,
              right: AppSizeConstants.defaultSizedBoxLeftAndRightSpace),
          child: Container(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    'totalCorrectAnswer: \n${gameScreenData['totalCorrectGuess'] ?? "default"}'),
                if (gameScreenData['imageName'] != null)
                  Image.asset(
                      'assets/images/${gameScreenData['imageName']}.png'),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, "/homepage"),
                  child: Text(
                    AppTextContants.resultScreenTryAgainButton,
                    style: myTextStyle(24, Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
