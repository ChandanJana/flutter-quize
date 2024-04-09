import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/custom_widget/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = questions[currentQuestIndex];

    return SizedBox(
        width: double.infinity,

        /// Take the space as much as you can
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestions.question,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 153, 251),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),

              /// map allows you convert/transform to one value to other value
              /// map does not change original item order in list
              ///
              /// here ... is an operator that is called Spread operator
              /// column children can not take List<List<T>> but help of
              /// ... we can use List<List<T>>, here internally ... operator will
              /// add each answer button in column by adding comma(,)
              ...currentQuestions.getShuffledAnswer().map((item) {
                return AnswerButton(
                    answer: item,
                    onTap: () {
                      answerQuestion(item);
                    });
              })
              /*...currentQuestions.answers.map((item) {
                return AnswerButton(answer: item, onTap: () {});
              })*/
            ],
          ),
        ));
  }
}
