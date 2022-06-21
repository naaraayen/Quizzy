import 'package:flutter/material.dart';
import 'package:quizzer/data/question_bank.dart';

// ignore: must_be_immutable
class ScorePage extends StatelessWidget {
  int score;
  VoidCallback resetQuiz;
  ScorePage(this.score, this.resetQuiz, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DisplayText(getText: 'You Scored', getFontSize: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.ideographic,
                            children: [
                              //TODO: Add animation to the totalscore
                              DisplayText(
                                getText: score.toString(),
                                getFontSize: 60,
                              ),
                              DisplayText(
                                getText: ' out of ',
                                getFontSize: 20,
                              ),
                              DisplayText(
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

                          // () => Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => const Quizzy()),
                          //     ),
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

// ignore: must_be_immutable
class DisplayText extends StatelessWidget {
  DisplayText({Key? key, required this.getText, required this.getFontSize})
      : super(key: key);

  String getText;
  double getFontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      getText,
      style: TextStyle(
        color: Colors.white,
        fontSize: getFontSize,
        fontFamily: 'ConcertOne',
        //fontWeight: FontWeight.bold
      ),
    );
  }
}
