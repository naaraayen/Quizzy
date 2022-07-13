import 'package:flutter/material.dart';
//import 'package:quizzer/result_page.dart';
//import './question_bank.dart';

// ignore: must_be_immutable
class OptionButton extends StatefulWidget {
  String option;
  Function checkAnswer;
  String isCorrect;
  OptionButton(
      {Key? key,
      required this.option,
      required this.checkAnswer,
      required this.isCorrect})
      : super(key: key);

  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        widget.checkAnswer(widget.isCorrect);
      },
      style: TextButton.styleFrom(
        side: const BorderSide(color: Colors.white, width: 1.0),
        primary: Colors.white,
      ),
      child: Text(
        widget.option,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
