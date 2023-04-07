import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controllers/questionController.dart';
import 'package:quizapp/screens/component/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Body(),
    );
  }
}
