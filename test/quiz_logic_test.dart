import 'package:flutter_test/flutter_test.dart';
import 'package:quizanimais/quiz_logic.dart';

void main() {
  test('Verifica resposta correta', () {
    final quiz = QuizLogic([
      QuizQuestion(
        question: 'Qual animal late?',
        options: ['Gato', 'Cachorro'],
        correctIndex: 1,
      ),
    ]);

    expect(quiz.score, 0);
    quiz.answer(1);
    expect(quiz.score, 1);
    expect(quiz.isFinished, true);
  });
}
