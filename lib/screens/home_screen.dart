import 'package:flutter/material.dart';
import '../screens/question_screen.dart';
import '../widgets/category_picker.dart';
import '../widgets/difficulty_picker.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  var initialIndex = 0;
  var categoryId = 9;
  var difficulty = 'simple';

  void getCategoryId(int catId) {
    categoryId = catId;
  }

  void getDifficultyLevel(String difficultyLevel) {
    difficulty = difficultyLevel;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: create a theme picker to choose specific theme
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            CategoryPicker(getCategoryId),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(QuestionScreen.routeName, arguments: {
                      'categoryId' : categoryId,
                      'difficulty' : difficulty,

                    });
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
             DifficultyPicker(getDifficultyLevel),
          ],
        )));
  }
}
