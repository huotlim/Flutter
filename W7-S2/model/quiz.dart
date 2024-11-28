class Quiz {
  final String title;
  final List<Question> questions;

  Quiz({required this.title, required this.questions});

  @override
  String toString() {
    return 'Quiz(title: $title, questions: ${questions.join(', ')}\n)';
  }
}

class Question {
  final String title;
  final List<String> possibleAnswers;
  final String goodAnswer;

  const Question(
      {required this.title,
      required this.possibleAnswers,
      required this.goodAnswer});

  @override
  String toString() {
    return 'Question(title: $title, possibleAnswers: $possibleAnswers, goodAnswer: $goodAnswer)\n';
  }
}
