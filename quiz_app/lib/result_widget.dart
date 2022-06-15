import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final int score;
  ResultWidget(this.score);

  @override
  Widget build(BuildContext context) {
    return (Center(
      child: Text(
          "your information are ${GetScore(score)} your score is ${score}"),
    ));
  }

  String GetScore(int score) {
    if (score > 100) {
      return "Great";
    } else if (score >= 50) {
      return "Good";
    } else {
      return "Bad";
    }
  }
}
