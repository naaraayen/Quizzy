import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/temporary_data.dart';
import '../provider/question.dart';

// Display Options
class DisplayQuestion extends StatefulWidget {
  const DisplayQuestion({super.key});

  @override
  State<DisplayQuestion> createState() => _DisplayQuestionState();
}

class _DisplayQuestionState extends State<DisplayQuestion> {
  @override
  Widget build(BuildContext context) {
    final tempData = Provider.of<TemporaryData>(context);
    final questionData = Provider.of<Question>(context, listen: false);
    return Center(
      child: Text(
        //FIXME: fix encoding here
        questionData.questionItems[tempData.initialIndex].question,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Lobster',
            fontWeight: FontWeight.w400,
            fontSize: 25),
      ),
    );
  }
}
