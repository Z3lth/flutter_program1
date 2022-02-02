import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite Song?',
      'answers': [
        {'text': 'Helena Beats', 'score': 10},
        {'text': 'Feelings', 'score': 7},
        {'text': 'bTs JunGcOok smth', 'score': 1},
        {'text': 'MJ', 'score': 4},
      ]
    },
    {
      'questionText': 'What\'s your favorite Book?',
      'answers': [
        {'text': 'All The Bright Places', 'score': 7},
        {'text': 'Divergent Trilogy', 'score': 4},
        {'text': 'Looking for Alaska', 'score': 10},
        {'text': 'HaRrY pOTteR', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite Game?',
      'answers': [
        {'text': 'Destiny', 'score': 10},
        {'text': 'vAlOrAnT', 'score': 1},
        {'text': 'Forza Horizon', 'score': 4},
        {'text': 'Uncharted', 'score': 7},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('Quiz Over!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // questions = []; // doesnt work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffAD7FFB),
          title: Text('\'Yes, I am judging you\' Quiz'),
        ),
        backgroundColor: Color(0xffe8eaff),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
