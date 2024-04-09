import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/custom_widget/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.data, {super.key});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = data['correct_answer'] == data['user_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(isCorrectAnswer, (data['question_index'] as int) + 1)
        /*CircleAvatar(
                    backgroundColor:
                        item['correct_answer'] == item['user_answer']
                            ? Colors.green
                            : Colors.red,
                    child: Center(
                      child: Text(
                        ((item['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )*/
        ,
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                data['user_answer'] as String,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 202, 171, 252),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                data['correct_answer'] as String,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 181, 254, 246),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
