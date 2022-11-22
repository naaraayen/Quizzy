import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/question.dart';
import '../screens/score_screen.dart';
import '../provider/temporary_data.dart';
import '../widgets/option_button.dart';

// Displays Options
class DisplayOptions extends StatelessWidget {
  const DisplayOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final tempData = Provider.of<TemporaryData>(
      context,
    );
    final questionData = Provider.of<Question>(context, listen: false);
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: mediaQuery.size.width / 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 3.5,
      ),
      children: questionData.questionItems[tempData.initialIndex].options
          .map((optionItem) => OptionButton(
                option: optionItem,
                checkAnswer: (String selectedOption) {
                  if (tempData.initialIndex ==
                      questionData.questionItems.length - 1) {
                    Navigator.pushReplacementNamed(
                        context, ScoreScreen.routeName);
                    return;
                  }
                  if (selectedOption ==
                      questionData
                          .questionItems[tempData.initialIndex].correctAnswer) {
                    tempData.updateScore();
                    tempData.changeIndex();
                    return;
                  }
                  tempData.changeIndex();
                },
              ))
          .toList(),
    );
  }
}
