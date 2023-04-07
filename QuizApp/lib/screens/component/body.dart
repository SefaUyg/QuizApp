import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controllers/questionController.dart';
import 'package:quizapp/model/Question.dart';
import 'package:quizapp/screens/component/progress_bar.dart';
import 'package:quizapp/screens/component/question_card.dart';
import 'package:quizapp/screens/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.red],
          ),
      ),
      child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: ProgressBar(),
      ),
      SizedBox(height: kDefaultPadding),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Obx(()=> Text.rich(TextSpan(
          text: "Question ${_questionController.questionNumber.value}",
          style: Theme.of(context).textTheme.headline4?.copyWith(color: kSecondaryColor),
          children: [
            TextSpan(text: "/${_questionController.questions.length}", style: Theme.of(context).textTheme.headline5?.copyWith(color: kSecondaryColor))
          ],
        )),),
      ),
      Divider(thickness: 1.5),
      SizedBox(height: kDefaultPadding),
      Expanded(child: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _questionController.pageController,
        onPageChanged: _questionController.updateTheQnNum,
        itemCount: _questionController.questions.length,
        itemBuilder: (context, index) => QuestionCard(question: _questionController.questions[index],),
      ),
      ),
        ],
        ),)
    );
  }
}