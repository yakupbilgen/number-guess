import 'package:flutter/material.dart';

import '../constants/app_size_constants.dart';
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
    Size deviceSize = MediaQuery.of(context).size;

    Map? gameScreenData = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppSizeConstants.defaultSizedBoxLeftAndRightSpace,
              right: AppSizeConstants.defaultSizedBoxLeftAndRightSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (gameScreenData['totalCorrectGuess'] != null)
                Column(
                  children: [
                    Text(
                      AppTextContants.totalCorrectAnswer,
                      style: myTextStyle(32, Colors.red),
                    ),
                    Text(
                      gameScreenData['totalCorrectGuess'].toString(),
                      style: myTextStyle(24, Colors.black),
                    )
                  ],
                ),
              if (gameScreenData['imageName'] != null)
                SizedBox(
                    height: deviceSize.height * 0.4,
                    child: Image.asset(
                        'assets/images/${gameScreenData['imageName']}.png')),
              SizedBox(
                height: deviceSize.height * 0.1,
                width: deviceSize.width - 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, "/homepage"),
                  child: Text(
                    AppTextContants.resultScreenTryAgainButton,
                    style: myTextStyle(24, Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
