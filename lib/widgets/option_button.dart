import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OptionButton extends StatelessWidget {
  String option;
  Function checkAnswer;
  OptionButton({
    Key? key,
    required this.option,
    required this.checkAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => checkAnswer(option),
      style: TextButton.styleFrom(
        side: const BorderSide(color: Colors.white, width: 1.0),
        primary: Colors.white,
      ),
      child: Text(
        option,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
