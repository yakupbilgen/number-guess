import 'package:flutter/material.dart';

import '../constants/app_size_constants.dart';
import '../constants/app_text_contansts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTextContants.appBarTitleGameScreen),
        centerTitle: true,
        elevation: AppSizeConstants.appBarElevationSize,
      ),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
