import 'package:flutter/material.dart';
import 'package:quizzer/data/question_bank.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      QuestionBank.questionList[index]['questionText'].toString(),
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Lobster',
          fontWeight: FontWeight.w400,
          fontSize: 25),
    );
  }
}
