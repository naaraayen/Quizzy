import 'package:flutter/material.dart';
import '../screens/question_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: create a theme picker to choose specific theme
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
            child: Center(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(QuestionScreen.routeName);
            },
            child: SizedBox(
              height: 200,
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 75,
                      width: 75,
                      child: Image.asset(
                        'assets/icons/start_logo.png',
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'START THE QUIZ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ConcertOne',
                    ),
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
