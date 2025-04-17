import 'package:flutter/material.dart';
import 'quiz_logic.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz de Animais',
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late QuizLogic quiz;

  @override
  void initState() {
    super.initState();
    quiz = QuizLogic([
      QuizQuestion(
        question: 'Qual animal faz "miau"?',
        options: ['Cachorro', 'Gato', 'Vaca'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Qual animal faz "au au"?',
        options: ['Gato', 'Pato', 'Cachorro'],
        correctIndex: 2,
      ),
    ]);
  }

  void responder(int index) {
    setState(() {
      quiz.answer(index);
    });
  }

  void reiniciarQuiz() {
    setState(() {
      quiz.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (quiz.isFinished) {
      return Scaffold(
        appBar: AppBar(title: const Text('Resultado')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Pontuação: ${quiz.score}/${quiz.totalQuestions}'),
              ElevatedButton(
                onPressed: reiniciarQuiz,
                child: const Text('Reiniciar'),
              ),
            ],
          ),
        ),
      );
    }

    final q = quiz.currentQuestion;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pergunta ${quiz.currentIndex + 1}/${quiz.totalQuestions}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(q.question, style: const TextStyle(fontSize: 24)),
          ...List.generate(q.options.length, (i) {
            return ElevatedButton(
              onPressed: () => responder(i),
              child: Text(q.options[i]),
            );
          }),
        ],
      ),
    );
  }
}
