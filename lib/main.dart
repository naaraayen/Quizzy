import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/temporary_data.dart';
import './screens/home_screen.dart';
import './provider/question.dart';
import './screens/score_screen.dart';
import './screens/question_screen.dart';


void main() {
  runApp(const Quizzy());
}

class Quizzy extends StatefulWidget {
  const Quizzy({Key? key}) : super(key: key);

  @override
  State<Quizzy> createState() => _QuizzyState();
}

class _QuizzyState extends State<Quizzy> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Question()),
        ChangeNotifierProvider(create: (ctx) => TemporaryData())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.teal,
          // TODO: Implement proper theme
        ),
        routes: {
          '/': (ctx) => Home(),
          QuestionScreen.routeName: (ctx) => const QuestionScreen(),
          ScoreScreen.routeName: (ctx) => const ScoreScreen(),
        },
      ),
    );
  }
}
