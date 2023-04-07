import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/screens/quiz_screen.dart';
import 'package:quizapp/screens/score/score_screen.dart';
import 'package:quizapp/screens/welcome_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WelcomeScreen(),
    );
  }
}