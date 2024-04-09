import 'package:flutter/material.dart';
import 'package:quiz_app/custom_widget/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((item) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: SummaryItem(item),
            );
          }).toList(),
        ),
      ),
    );
  }
}
