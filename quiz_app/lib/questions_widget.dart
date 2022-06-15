import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String questionText;

  QuestionWidget(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(questionText),
    );
  }
}
