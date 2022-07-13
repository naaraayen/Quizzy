import 'package:flutter/material.dart';
import 'package:quizzer/widgets/option_button.dart';
import 'package:quizzer/widgets/question_text.dart';
import 'package:quizzer/data/question_bank.dart';
import 'package:quizzer/widgets/question_counter.dart';

// ignore: must_be_immutable
class QuestionPage extends StatefulWidget {
  int index;
  Function checkAnswer;
  Function colorPicker;
  Color defaultColor;

  QuestionPage(
      {Key? key,
      required this.index,
      required this.checkAnswer,
      required this.colorPicker,
      required this.defaultColor})
      : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late Color selectedColor;
  @override
  void initState() {
    selectedColor = widget.defaultColor;
    super.initState();
  }

  Widget buildColorPicker(MediaQueryData mediaQuery, Color getColor) {
    return GestureDetector(
      onTap: () {
        widget.colorPicker(getColor);
        selectedColor = getColor;
      },
      child: Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: selectedColor == getColor
                      ? Colors.white
                      : Colors.transparent,
                  width: 1.0)),
          child: CircleAvatar(
            backgroundColor: getColor,
            radius: mediaQuery.size.height * 0.015,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                buildColorPicker(mediaQuery, Colors.teal.shade800),
                buildColorPicker(mediaQuery, Colors.blue.shade800),
                buildColorPicker(mediaQuery, Colors.red.shade800),
                buildColorPicker(mediaQuery, Colors.orange.shade800),
              ],
            ),
            QuestionCounter(index: widget.index),
          ],
        ),
        Center(
          child: QuestionText(index: widget.index),
        ),
        SizedBox(
          height: mediaQuery.size.height * 0.2,
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: mediaQuery.size.width / 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4,
            ),
            children: (QuestionBank.questionList[widget.index]['options']
                    as List<Map<String, Object>>)
                .map((options) => OptionButton(
                    option: options['optionText'].toString(),
                    isCorrect: options['isCorrect'].toString(),
                    checkAnswer: widget.checkAnswer))
                .toList(),
          ),
        )
      ],
    );
  }
}
