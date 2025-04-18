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
      home: const QuizPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  late QuizLogic quiz;

  @override
  void initState() {
    super.initState();
    quiz = QuizLogic([
      QuizQuestion(
        question: 'Qual animal faz "miau"?',
        options: ['Cachorro', 'Gato', 'Vaca'],
        correctIndex: 1,
        imageAsset: 'assets/images/gato.png',
      ),
      QuizQuestion(
        question: 'Qual animal faz "au au"?',
        options: ['Gato', 'Pato', 'Cachorro'],
        correctIndex: 2,
        imageAsset: 'assets/images/cachorro.png',
      ),
      QuizQuestion(
        question: 'Qual animal gosta de pasto?',
        options: ['Vaca', 'Pato', 'Gato'],
        correctIndex: 0,
        imageAsset: 'assets/images/vaca.png',
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
              Text('Pontuação: ${quiz.score}/${quiz.totalQuestions}', style: const TextStyle(fontSize: 24)),
              const SizedBox(height: 20),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(q.imageAsset, height: 200),
              const SizedBox(height: 20),
              Text(q.question, style: const TextStyle(fontSize: 24), textAlign: TextAlign.center),
              const SizedBox(height: 20),
              ...List.generate(q.options.length, (i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ElevatedButton(
                    onPressed: () => responder(i),
                    child: Text(q.options[i]),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
