import 'package:flutter/material.dart';

import '../constants/app_text_contansts.dart';

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
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Result'),
              Image.asset('assets/images/smile.png'),
              ElevatedButton(
                onPressed: () {},
                child: const Text('data'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
