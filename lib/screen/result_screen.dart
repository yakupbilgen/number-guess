import 'package:flutter/material.dart';
import 'package:numberguess/constants/app_text_contansts.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTextContants.appBarTitleResultScreen),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('data'),
            Image.asset('url'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('data'),
            )
          ],
        ),
      ),
    );
  }
}
