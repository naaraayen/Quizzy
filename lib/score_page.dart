import 'package:flutter/material.dart';
import 'package:quizzer/data/question_bank.dart';
import './widgets/score.dart';

// ignore: must_be_immutable
class ScorePage extends StatelessWidget {
  int score;
  VoidCallback resetQuiz;
  Color getColor;
  ScorePage(this.score, this.resetQuiz, this.getColor,{Key? key}) : super(key: key);

  Widget displayText({required String getText, required double getFontSize}) {
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: getColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          displayText(getText: 'You Scored', getFontSize: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.ideographic,
                            children: [
                              //Added animation to the Score
                              DisplayScore(score),
                              displayText(
                                getText: ' out of ',
                                getFontSize: 20,
                              ),
                              displayText(
                                getText:
                                    QuestionBank.questionList.length.toString(),
                                getFontSize: 30,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      TextButton(
                          onPressed: resetQuiz,
                          style: TextButton.styleFrom(
                            side: const BorderSide(
                                color: Colors.white, width: 1.0),
                            primary: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Play Agan',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.refresh,
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
        ));
  }
}
