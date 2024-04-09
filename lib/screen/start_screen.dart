import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  /// Here startQuiz is Function type parameter, this function not taking any parameter and return nothing.
  /// const StartScreen(void Function() startQuiz,{super.key}) : this.startQuiz = startQuiz;
  const StartScreen(this.startQuiz, {super.key});

  /// This function not taking any parameter and return nothing
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// To transparency the image option 1
          /*Opacity(
            opacity: 0.5,
            child: Image.asset(
              "assets/images/quiz-logo.png",
              width: 200,
            ),
          ),*/

          /// To transparency the image option 2
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 200,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Learn Flutter The Fun Way!",
            style: GoogleFonts.lato(
              fontSize: 20,
              color: const Color.fromARGB(255, 237, 223, 252),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            /// Option 1
            /*onPressed: (){
              startQuiz();
            },*/

            /// Option 2
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
            ),
            label: Text(
              "Start Quiz",
            ),
          )
        ],
      ),
    );
  }
}
