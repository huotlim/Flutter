import 'package:flutter/material.dart';
import 'package:flutter_project/W7-S2/model/submission.dart';
import 'package:flutter_project/W7-S2/model/quiz.dart';
import 'package:flutter_project/W7-S2/screens/question_screen.dart';
import 'package:flutter_project/W7-S2/screens/result_screen.dart';
import 'package:flutter_project/W7-S2/screens/welcome_screen.dart';

enum QuizState { notStarted, started, finished }

class QuizApp extends StatefulWidget {
  final Quiz quiz;

  QuizApp({required this.quiz});

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Widget? screen;
  QuizState quizState = QuizState.notStarted;
  Submission? submission;

  void changeScreen(QuizState newScreen) {
    setState(() {
      quizState = newScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (quizState) {
      case QuizState.notStarted:
        screen = WelcomeScreen(
          quizTitle: "Crazy Quiz",
          onStart: () => changeScreen(QuizState.started),
        );
        break;
      case QuizState.started:
        screen = QuestionScreen(
          quiz: widget.quiz,
          onFinish: (submission) {
            setState(() {
              this.submission = submission; // Save the answers and score
              changeScreen(QuizState.finished);
            });
          },
        );
        break;
      case QuizState.finished:
        screen = ResultScreen(
            onRestart: () => changeScreen(QuizState.started),
            submission: submission!);
        break;
    }

    return Scaffold(
      body: Center(child: screen),

    );
  }
}

void main() {
  Question q1 = const Question(
      title: "Who is the best teacher?",
      possibleAnswers: ["ronan", "hongly", 'leangsiv'],
      goodAnswer: 'ronan');
  Question q2 = const Question(
      title: "Which color is the best?",
      possibleAnswers: ["blue", "red", 'green'],
      goodAnswer: 'red');

  List<Question> myQuestions = [q1, q2];

  Quiz myQuiz = Quiz(title: "Crazy Quizz", questions: myQuestions);

  runApp(MaterialApp(
    home: QuizApp(quiz: myQuiz),
  ));
}
