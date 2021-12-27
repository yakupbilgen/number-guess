import 'package:flutter/material.dart';

import 'screen/game_screen.dart';
import 'screen/result_screen.dart';
import 'screen/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: "/homepage",
      routes: {
        "/homepage": (context) => const HomePage(),
        "/gamescreen": (context) => const GameScreen(),
        "/resultscreen": (context) => const ResultScreen(),
      },
    ),
  );
}
