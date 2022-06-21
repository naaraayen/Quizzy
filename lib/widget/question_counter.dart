import 'package:flutter/material.dart';

import '../data/question_bank.dart';

class QuestionCounter extends StatelessWidget {
  final int index;
  const QuestionCounter({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: [
        Counter(
          getText: (index + 1).toString(),
          getFontSize: 30,
        ),
        Counter(
          getText: ' / ',
          getFontSize: 20,
        ),
        Counter(
          getText: QuestionBank.questionList.length.toString(),
          getFontSize: 20,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class Counter extends StatelessWidget {
  String getText;
  double getFontSize;
  Counter({Key? key, required this.getText, required this.getFontSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      getText,
      style: TextStyle(
          color: Colors.white,
          fontFamily: 'Gelasio',
          fontSize: getFontSize,
          fontWeight: FontWeight.bold),
    );
  }
}
