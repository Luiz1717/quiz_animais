import 'package:flutter_test/flutter_test.dart';
import 'package:quizanimais/quiz_logic.dart';

void main() {
  group('QuizLogic', () {
    test('Resposta correta aumenta pontuação', () {
      final quiz = QuizLogic([
        QuizQuestion(
          question: 'Qual animal late?',
          options: ['Gato', 'Cachorro'],
          correctIndex: 1,
          imageAsset: 'assets/images/cachorro.png',
        ),
      ]);

      expect(quiz.score, 0);
      quiz.answer(1);
      expect(quiz.score, 1);
      expect(quiz.isFinished, true);
    });

    test('Resposta errada não aumenta pontuação', () {
      final quiz = QuizLogic([
        QuizQuestion(
          question: 'Qual animal mia?',
          options: ['Cachorro', 'Gato'],
          correctIndex: 1,
          imageAsset: 'assets/images/gato.png',
        ),
      ]);

      quiz.answer(0);
      expect(quiz.score, 0);
      expect(quiz.isFinished, true);
    });

    test('Reiniciar quiz zera o progresso', () {
      final quiz = QuizLogic([
        QuizQuestion(
          question: 'Qual animal gosta de pasto?',
          options: ['Vaca', 'Gato'],
          correctIndex: 0,
          imageAsset: 'assets/images/vaca.png',
        ),
      ]);

      quiz.answer(0);
      expect(quiz.score, 1);
      quiz.reset();
      expect(quiz.score, 0);
      expect(quiz.isFinished, false);
    });
  });
}
