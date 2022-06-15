import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String text;
  final VoidCallback selectHandler;
  final VoidCallback selectHandlerScore;
  AnswerWidget(this.text, this.selectHandler, this.selectHandlerScore);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          children: [
            ElevatedButton(
              child: Text(text),
              onPressed: () {
                selectHandler();
                selectHandlerScore();
              },
            )
          ],
        ));
  }

  List<Widget> buttonListAnswer(List<String> textList) {
    final children = <Widget>[];
    var answerList = <String>[];
    answerList.addAll(textList);
    for (var i = 0; i < 4; i++) {
      children.add(ElevatedButton(
          onPressed: () {
            selectHandlerScore();
            selectHandler();
          },
          child: Text(answerList[i])));
    }
    return children;
  }
}
