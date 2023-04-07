import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/model/Question.dart';
import 'package:quizapp/screens/score/score_screen.dart';

class QuestionController extends GetxController with SingleGetTickerProviderMixin{
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data.map(
    (question)=>Question(
    id: question['id'], 
    question: question['question'], 
    answer: question['answer_index'], 
    options: question['options'])).toList();

    List<Question> get questions => this._questions;

    bool _isAnswered = false;
    bool get isAnswered => this._isAnswered;

    late int _correctAnswer;
    int get correctAnswer => this._correctAnswer;

    late int _selAnswer;
    int get selAnswer => this._selAnswer;

    RxInt _questionNumber = 1.obs;
    RxInt get questionNumber => this._questionNumber;

    late int _numOfCorrectAns = 0;
    int get numOfCorrectAns => this._numOfCorrectAns;

  @override
  void onInit(){
    _animationController = AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)..addListener(() {
      update();
      }
      );
      _animationController.forward().whenComplete(nextQuestion);
      _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose(){
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex){

    _isAnswered = true;
    _correctAnswer = question.answer;
    _selAnswer = selectedIndex;

    if(_correctAnswer == _selAnswer) _numOfCorrectAns++;

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 1), (){
      nextQuestion();
    });
  }

  void nextQuestion(){
    if(_questionNumber.value != _questions.length){
      _isAnswered = false;
      _pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    }
    else{
    Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index){
    _questionNumber.value = index + 1;
  }
}