import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screen/question_screen.dart';
import 'package:quiz_app/screen/result_screen.dart';
import 'package:quiz_app/screen/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

/// Every Flutter Widget has a built-in lifecycle: A collection of methods that are automatically executed by Flutter (at certain points of time).
/// There are three extremely important (stateful) widget lifecycle methods you should be aware of:
///
///    1. initState(): Executed by Flutter when the StatefulWidget's State object is initialized
///
///    2. build(): Executed by Flutter when the Widget is built for the first time AND after setState() was called
///
///    3. dispose(): Executed by Flutter right before the Widget will be deleted (e.g., because it was displayed conditionally)
///

class _QuizState extends State<Quiz> {
  /// Lifting Up State
  /// Passing the method as a parameter to the another method is called  'Lifting Up State'

  /// Widget? means initially activeScreen is null
  Widget? _activeScreen;
  List<String> _selectedAnswer = [];

  /// In Flutter, "initState" is a special method that you can override when working with stateful widgets.
  /// This method is called once when the widget/state is first created or called after constructor called.
  /// You can perform one-time initialization tasks here.
  @override
  void initState() {
    _activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer) {
    _selectedAnswer.add(answer);

    if (_selectedAnswer.length == questions.length) {
      setState(() {
        _activeScreen = ResultScreen(_selectedAnswer, restartQuiz);
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswer = [];
      _activeScreen = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  void switchScreen() {
    setState(() {
      _activeScreen = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.deepPurpleAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: _activeScreen,
        ),
      ),
    );
  }
}
