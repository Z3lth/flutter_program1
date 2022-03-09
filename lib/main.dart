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
      'questionText': 'How was your day?',
      'answers': [
        {'text': 'Great', 'score': 10},
        {'text': 'Average', 'score': 7},
        {'text': 'Bad', 'score': 4},
        {'text': 'Absolutely fcking Tragic', 'score': 1},
      ]
    },
    {
      'questionText': 'What was the best/worst thing that happened today?',
      'answers': [
        {
          'text': 'Someone asked me out (didn\'t happen, dont lie) ',
          'score': 10
        },
        {'text': 'Got free Pitzah', 'score': 7},
        {'text': 'Fell on my face', 'score': 4},
        {'text': 'Lost my most valuable thing', 'score': 1},
      ]
    },
    {
      'questionText': 'On the scale of 1-10, How productive was your day?',
      'answers': [
        {'text': '8-10', 'score': 10},
        {'text': '5-7', 'score': 7},
        {'text': '2-4', 'score': 4},
        {'text': '1 Swipe the pain away with instagram reels', 'score': 1},
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
          backgroundColor: Color(0xff219F94),
          title: Text('How was your day survey'),
        ),
        backgroundColor: Color(0xffFBF8F1),
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
