import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/custom_widget/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.choosenAnswer, this.onRestart, {super.key});

  final void Function() onRestart;
  final List<String> choosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestion = questions.length;
    final correctQuestion = summaryData.where((item) {
      return item['user_answer'] == item['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,

      /// Take the space as much as you can
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctQuestion out of $totalQuestion questions correctly',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: onRestart,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.restart_alt),
              label: Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
