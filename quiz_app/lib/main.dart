import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/quiz.dart';
import 'questions_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> myNavigatorKey = GlobalKey<NavigatorState>();

  var categories = [
    "General Knowledge",
    "Entertainment: Books",
    "Entertainment: Film",
    "Entertainment: Music",
    "Entertainment: Musicals & Theatres",
    "Mythology",
    "Sports"
  ];

  var questions = AllQuestion();
  var catIndex = 0;

  void _answerQuestion() {
    setState(() {});
  }

  void _getQuestion(int value, GlobalKey<NavigatorState> myNavigatorKey,
      BuildContext context) async {
    int dataIndex = 0;
    switch (value) {
      case 0:
        dataIndex = 9;
        break;
      case 1:
        dataIndex = 10;
        break;
      case 2:
        dataIndex = 11;
        break;
      case 3:
        dataIndex = 12;
        break;
      case 4:
        dataIndex = 13;
        break;
      case 5:
        dataIndex = 20;
        break;
      case 6:
        dataIndex = 21;
        break;
      default:
    }
    final response = await http.get(Uri.parse(
        'https://opentdb.com/api.php?amount=10&category=${dataIndex}&difficulty=medium&type=multiple'));

    var data = AllQuestion.fromJson(jsonDecode(response.body));

    myNavigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => QuizWidget(data)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: myNavigatorKey,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Test flutter"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Chose a category"),
                  Scrollbar(
                      child: Column(
                          children:
                              buttonList(categories, myNavigatorKey, context))),
                ],
              ),
            )));
  }

  List<Widget> buttonList(List<String> text,
      GlobalKey<NavigatorState> myNavigatorKey, BuildContext context) {
    final children = <Widget>[];
    for (var i = 0; i < text.length; i++) {
      children.add(ElevatedButton(
          onPressed: () {
            _getQuestion(i, myNavigatorKey, context);
          },
          child: Text(text[i])));
    }
    return children;
  }
}
