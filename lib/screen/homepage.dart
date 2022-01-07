import 'package:flutter/material.dart';

import '../constants/app_size_constants.dart';
import '../constants/app_text_contansts.dart';
import '../constants/widgets/app_text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double guessRange = 0.0;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppSizeConstants.defaultSizedBoxLeftAndRightSpace,
              right: AppSizeConstants.defaultSizedBoxLeftAndRightSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: deviceSize.height * 0.4,
                child: Image.asset('assets/images/dice.png'),
              ),
              const SizedBox(
                height: AppSizeConstants.defaultSizedBoxHeight,
              ),
              SizedBox(
                height: deviceSize.height * 0.1,
                width: deviceSize.width - 50,
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, "/gamescreen"),
                    child: Text(
                      AppTextContants.startButton,
                      style: myTextStyle(32, Colors.black),
                    ),
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
