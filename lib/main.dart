import 'package:flutter/material.dart';
import 'package:quizzer/data/question_bank.dart';
import 'package:quizzer/score_page.dart';
import 'package:quizzer/question_page.dart';

void main() {
  runApp(const Quizzy());
}

class Quizzy extends StatefulWidget {
  const Quizzy({Key? key}) : super(key: key);

  @override
  State<Quizzy> createState() => _QuizzyState();
}

class _QuizzyState extends State<Quizzy> {
  int _index = 0;
  int _score = 0;
  _resetQuiz() {
    setState(() {
      _index = 0;
    });
    
  }

  _checkAnswer(String getSelect) {
    if (getSelect == 'true') {
      _score = _score + 1;
    }
    setState(() {
      _index = _index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              //TODO : Add colorpicker option to change the bg color (persistence)
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: _index < QuestionBank.questionList.length
                    ? QuestionPage(
                        index: _index,
                        checkAnswer: _checkAnswer,
                      )
                    : ScorePage(_score, _resetQuiz),
              ),
            )));
  }
}
