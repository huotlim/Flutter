import 'package:flutter/material.dart';
import 'package:flutter_project/W7-S2/model/submission.dart';

class ResultScreen extends StatelessWidget {
  final Submission submission;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.submission,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    int score = submission.getScore();
    int totalQuestions = submission.answers.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        backgroundColor: Colors.blue[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildAnimatedScore(score, totalQuestions),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: submission.answers.length,
                itemBuilder: (context, index) {
                  final question = submission.answers.keys.elementAt(index);
                  final answer = submission.answers[question]!;

                  return _buildQuestionResult(
                    index: index + 1,
                    question: question.title,
                    possibleAnswers: question.possibleAnswers,
                    userAnswer: answer.userAnswer,
                    correctAnswer: question.goodAnswer,
                    isCorrect: answer.isCorrect(),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            _buildRestartButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedScore(int score, int totalQuestions) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: score),
      duration: const Duration(seconds: 2),
      builder: (context, value, child) {
        return Text(
          "You answered $value on $totalQuestions!",
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          textAlign: TextAlign.center,
        );
      },
    );
  }

  Widget _buildQuestionResult({
    required int index,
    required String question,
    required List<String> possibleAnswers,
    required String userAnswer,
    required String correctAnswer,
    required bool isCorrect,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildQuestionIndex(index, isCorrect),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    question,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...possibleAnswers.map((answer) {
              return _buildAnswerOption(
                answer: answer,
                isSelected: answer == userAnswer,
                isCorrectAnswer: answer == correctAnswer,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionIndex(int index, bool isCorrect) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: isCorrect ? Colors.green : Colors.red,
      child: Text(
        '$index',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAnswerOption({
    required String answer,
    required bool isSelected,
    required bool isCorrectAnswer,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? (isCorrectAnswer ? Colors.green[100] : Colors.red[100])
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            answer,
            style: TextStyle(
              fontSize: 16,
              color: isCorrectAnswer ? Colors.green : Colors.black,
            ),
          ),
          if (isSelected)
            Icon(
              isCorrectAnswer ? Icons.check : Icons.close,
              color: isCorrectAnswer ? Colors.green : Colors.red,
            ),
        ],
      ),
    );
  }

Widget _buildRestartButton() {
  return ElevatedButton.icon(
    onPressed: onRestart,
    icon: const Icon(
      Icons.restart_alt,
      color: Colors.white, // Set the icon color to white
    ),
    label: const Text(
      "Restart Quiz",
      style: TextStyle(fontSize: 18, color: Colors.white),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 20, 133, 9),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}

}
