import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/question.dart';
import '../widgets/display_options.dart';
import '../widgets/display_question.dart';
import '../widgets/question_counter.dart';

class QuestionScreen extends StatefulWidget {
  static const routeName = '/DisplayQuestionScreen';

  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late Future initFetch;
  Color selectedColor = Colors.teal.shade800;
  var isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      final catId = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      getJsonData(catId['categoryId'], catId['difficulty']);
    }
    isInit = false;
    super.didChangeDependencies();
  }

  void getJsonData(int catId, String difficulty) {
    initFetch =
        Provider.of<Question>(context, listen: false).fetchQuestions(catId, difficulty);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder(
        future: initFetch,
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.done) {
            if (dataSnapshot.hasError) {
              return const Center(
                child: Text('Unable To Fetch'),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      QuestionCounter(),
                    ],
                  ),
                  // Display question and its options
                  const DisplayQuestion(),
                  SizedBox(
                      height: deviceSize.height * 0.25,
                      child: const DisplayOptions()),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Hold On',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
