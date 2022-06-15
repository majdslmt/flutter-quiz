import 'package:flutter/material.dart';
import 'package:quiz_app/questions_widget.dart';
import 'questions.dart';
import 'answer.dart';
import 'questions.dart';
import 'result_widget.dart';

class QuizWidget extends StatefulWidget {
  final AllQuestion QustionsList;
  QuizWidget(this.QustionsList);

  @override
  State<QuizWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<QuizWidget> {
  int _qustionIndex = 0;
  int _score = 0;
  int answerIndex = 0;
  List<String> quizAnswers = [];

  @override
  void initState() {
    // TODO: implement initState
    quizAnswers.add(
        widget.QustionsList.results![_qustionIndex].correctAnswer.toString());

    quizAnswers.addAll(
        widget.QustionsList.results![_qustionIndex].incorrectAnswers!.toList());

    super.initState();
  }

  void _addScore(String value) {
    print(value);
  }

  void _handler(int correctAnswer, String value) {
    if ((_qustionIndex > widget.QustionsList.results!.length)) {
      ResultWidget(_score);
    } else {
      setState(() {
        if (widget.QustionsList.results![_qustionIndex].correctAnswer ==
            value) {
          _score = _score + 10;
          print("right");
        } else {
          print("wrong");
        }
        _qustionIndex = _qustionIndex + 1;
        print(_qustionIndex);
        quizAnswers = [];
        quizAnswers.add(widget
            .QustionsList.results![_qustionIndex].correctAnswer
            .toString());

        quizAnswers.addAll(widget
            .QustionsList.results![_qustionIndex].incorrectAnswers!
            .toList());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Test flutter"),
            ),
            body: _qustionIndex < widget.QustionsList.results!.length
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        QuestionWidget(widget
                            .QustionsList.results![_qustionIndex].question
                            .toString()),
                        ...(quizAnswers.map((name) {
                          return AnswerWidget(
                              name,
                              () => _handler(_qustionIndex, name),
                              () => _addScore(name));
                        }))
                      ],
                    ),
                  )
                : ResultWidget(_score)));
  }
}
