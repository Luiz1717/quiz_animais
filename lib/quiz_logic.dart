class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String imageAsset;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.imageAsset,
  });
}

class QuizLogic {
  final List<QuizQuestion> _questions;
  int _currentQuestionIndex = 0;
  int _score = 0;

  QuizLogic(this._questions);

  QuizQuestion get currentQuestion => _questions[_currentQuestionIndex];
  int get currentIndex => _currentQuestionIndex;
  int get totalQuestions => _questions.length;
  int get score => _score;
  bool get isFinished => _currentQuestionIndex >= _questions.length;

  void answer(int selectedIndex) {
    if (!isFinished && selectedIndex == currentQuestion.correctIndex) {
      _score++;
    }
    _currentQuestionIndex++;
  }

  void reset() {
    _currentQuestionIndex = 0;
    _score = 0;
  }
}
