import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/question.dart';
import '../provider/temporary_data.dart';

class QuestionCounter extends StatelessWidget {
  const QuestionCounter({super.key});



  @override
  Widget build(BuildContext context) {
    final tempData = Provider.of<Question>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: [
        Consumer<TemporaryData>(
          builder: (ctx, tempData, _) => Counter(
            getText: (tempData.initialIndex + 1).toString(),
            getFontSize: 30,
          ),
        ),
        Counter(
          getText: ' / ',
          getFontSize: 20,
        ),
        Counter(
          getText: tempData.questionItems.length.toString(),
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
