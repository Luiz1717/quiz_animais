class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  });

  bool isCorrect(int index) => index == correctIndex;
}

class QuizLogic {
  final List<QuizQuestion> _questions;
  int _currentQuestionIndex = 0;
  int _score = 0;

  QuizLogic(this._questions);

  QuizQuestion get currentQuestion => _questions[_currentQuestionIndex];

  bool get isFinished => _currentQuestionIndex >= _questions.length;
  int get score => _score;
  int get totalQuestions => _questions.length;
  int get currentIndex => _currentQuestionIndex;

  void answer(int selectedIndex) {
    if (!isFinished) {
      if (currentQuestion.isCorrect(selectedIndex)) {
        _score++;
      }
      _currentQuestionIndex++;
    }
  }

  void reset() {
    _currentQuestionIndex = 0;
    _score = 0;
  }
}
