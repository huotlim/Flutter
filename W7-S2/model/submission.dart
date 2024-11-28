import 'quiz.dart';

class Answer {
  String questionAnswer;
  String userAnswer;

  Answer({required this.questionAnswer, required this.userAnswer});

  bool isCorrect() {
    return userAnswer.toLowerCase() == questionAnswer.toLowerCase();
  }

  String toString() {
    return 'Answer(questionAnswer: $questionAnswer, userAnswer: $userAnswer)';
  }
}

class Submission {
  Map<Question, Answer> answers = {};

  void addAnswer(Question question, Answer answer) {
    answers[question] = answer;
  }

  Answer? getAnswerFor(Question question) {
    // Check if the question exists in the map
    if (answers.containsKey(question)) {
      return answers[question];
    }
    return null;
  }

  int getScore() {
    int score = 0;
    for (var answer in answers.entries) {
      if (answer.value.isCorrect()) {
        score++;
      }
    }
    return score;
  }

  void removeAnswers() {
    answers.clear();
  }

  @override
  String toString() {
    return 'Submission(Question: ${answers.entries.map((e) => "${e.key.title}: ${e.value}").join(', ')})';
  }
}
