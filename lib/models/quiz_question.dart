class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswer() {
    /// 'of' constructor create new list based on another list
    final shuffledList = List.of(answers);

    /// shuffle does change original item order in list
    shuffledList.shuffle();
    return shuffledList;
  }
}
