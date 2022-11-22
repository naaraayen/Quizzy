import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/question.dart';
import '../provider/temporary_data.dart';
import '../widgets/animated_score.dart';

// ignore: must_be_immutable
class ScoreScreen extends StatelessWidget {
  static const routeName = '/ScoreScreen';

  const ScoreScreen({super.key});

  Widget customText({required String getText, required double getFontSize}) {
    return Text(
      getText,
      style: TextStyle(
        color: Colors.white,
        fontSize: getFontSize,
        fontFamily: 'ConcertOne',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tempData = Provider.of<TemporaryData>(context);
    final questionData = Provider.of<Question>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 75,
                      width: 75,
                      child: Image.asset('assets/icons/finish_logo.png')),
                    customText(getText: 'You Scored', getFontSize: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        //Animation to the Score
                        DisplayScore(tempData.score),
                        customText(
                          getText: ' out of ',
                          getFontSize: 20,
                        ),
                        customText(
                          getText: questionData.questionItems.length.toString(),
                          getFontSize: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  TextButton(
                      onPressed: () {
                        tempData.resetQuiz();
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      style: TextButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 1.0),
                        primary: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Back To Home',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.home,
                            color: Colors.white,
                          )
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
