import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 30) {
      resultText = 'A Gem (=★ω★=)ฅ';
    } else if (resultScore < 30 && resultScore >= 20) {
      resultText = 'Cool 〜(￣△￣〜) ';
    } else if (resultScore < 20 && resultScore >= 10) {
      resultText = 'umm Good ( ⋂‿⋂\’) ';
    } else if (resultScore < 10 && resultScore > 4) {
      resultText = 'lol normie (￣︶ ￣ ;)';
    } else {
      resultText = 'NO. Nononononononope';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xffF594B7)),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text('Restart Quiz'),
            textColor: Colors.white,
            onPressed: resetHandler,
            color: Color(0xff92B2FD),
          )
        ],
      ),
    );
  }
}
