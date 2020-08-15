import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'quwstionText': 'What\'s your favorite color ?',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'quwstionText': 'What\'s your favorite animal ?',
      'answers': ['Cat', 'Dog', 'Fish', 'Elephat']
    },
    {
      'quwstionText': 'What\'s your favorite instructor ?',
      'answers': ['Max', 'Jim', 'Slash', 'Robert']
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < questions.length) {
      print('More question');
    }
    else{
      print('No more question');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: <Widget>[
                  Question(questions[_questionIndex]['quwstionText']),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList(),
                ],
              )
            : Center(child: Text('You did it!')),
      ),
    );
  }
}
