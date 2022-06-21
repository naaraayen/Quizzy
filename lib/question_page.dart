import 'package:flutter/material.dart';
import 'package:quizzer/widget/option_button.dart';
import 'package:quizzer/widget/question_text.dart';
import 'package:quizzer/data/question_bank.dart';
import 'package:quizzer/widget/question_counter.dart';

// ignore: must_be_immutable
class QuestionPage extends StatelessWidget {
  int index;
  Function checkAnswer;
  QuestionPage({Key? key, required this.index, required this.checkAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        QuestionCounter(index: index),
        Center(
          child: QuestionText(index: index),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //TODO : Change the way of displaying options
          children: (QuestionBank.questionList[index]['options']
                  as List<Map<String, Object>>)
              .map((options) => OptionButton(
                  option: options['optionText'].toString(),
                  isCorrect: options['isCorrect'].toString(),
                  checkAnswer: checkAnswer))
              .toList(),
        )
      ],
    );
  }
}
