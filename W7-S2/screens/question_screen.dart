import 'package:flutter/material.dart';
import 'package:flutter_project/W7-S2/model/quiz.dart';
import 'package:flutter_project/W7-S2/model/submission.dart';


class QuestionScreen extends StatefulWidget {
  final Quiz quiz;
  final Function(Submission) onFinish;

  const QuestionScreen({super.key, required this.quiz, required this.onFinish});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen>
    with SingleTickerProviderStateMixin {
  int currentQuestionIndex = 0;
  Submission submission = Submission();
  String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.quiz.questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: Colors.blue[400],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        child: Container(
          key: ValueKey<int>(currentQuestionIndex),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...currentQuestion.possibleAnswers.map((answer) {
                final isSelected = selectedAnswer == answer;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAnswer = answer;
                    });
                    submission.addAnswer(
                      currentQuestion,
                      Answer(
                        questionAnswer: currentQuestion.goodAnswer,
                        userAnswer: selectedAnswer!,
                      ),
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isSelected ? const Color.fromARGB(255, 218, 9, 2) : Colors.blue[400],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Colors.tealAccent.withOpacity(0.6),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ]
                          : [],
                    ),
                    child: Text(
                      answer,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }),
              const SizedBox(height: 40),
              if (currentQuestionIndex < widget.quiz.questions.length - 1)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 20, 133, 9),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: selectedAnswer == null
                      ? null
                      : () {
                          setState(() {
                            currentQuestionIndex++;
                            selectedAnswer =
                                null; // Reset for the next question
                          });
                        },
                  child: const Text(
                    "Next Question",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              if (currentQuestionIndex == widget.quiz.questions.length - 1)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 20, 133, 9),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: selectedAnswer == null
                      ? null
                      : () => widget.onFinish(submission),
                  child: const Text(
                    "Finish the Quiz",
                             style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
