import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuestionItem {
  String question;
  String category;
  String correctAnswer;
  List<dynamic> options;
  QuestionItem({
    required this.question,
    required this.category,
    required this.correctAnswer,
    required this.options,
  });
}

class Question with ChangeNotifier {
  List<QuestionItem> _questionItems = [];

  List<QuestionItem> get questionItems {
    return _questionItems;
  }

  // TODO: Add user token to fetch data from rest api
  // TODO: Create custom exception handler
  Future<void> fetchQuestions() async {
    final url = Uri.parse(
        'https://opentdb.com/api.php?amount=20&difficulty=hard&type=multiple');
    try {
      final response =
          await http.get(url, headers: {"Accept": "application/json"});
      final responseBody = json.decode(response.body);
      //print(response.body);
      List<QuestionItem> extractedQuestion = [];
      final extractedData = responseBody['results'];
      for (var itemData in extractedData) {

        // Merging correct and incorrect answers
        Random random = Random();
        var mergedOptions = [];
        final incorrectAnswers = itemData['incorrect_answers'] as List<dynamic>;
        mergedOptions = [...incorrectAnswers];
        mergedOptions.insert(random.nextInt(incorrectAnswers.length),
            itemData['correct_answer']);

        extractedQuestion.add(QuestionItem(
          question: itemData['question'],
          category: itemData['category'],
          correctAnswer: itemData['correct_answer'],
          options: mergedOptions,
        ));
        _questionItems = extractedQuestion;

        debugPrint(_questionItems[0].options.length.toString());
        notifyListeners();
      }
    } catch (error) {
      rethrow;
    }
  }
}
