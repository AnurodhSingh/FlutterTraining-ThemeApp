import 'package:flutter/material.dart';
import 'package:theme_app/utils/constants.dart';

/// Quiz screen
class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenWidgetState createState() => _QuizScreenWidgetState();
}

/// Quiz screen widget state
class _QuizScreenWidgetState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            _flagContainer(),
            _questionContainer(),
          ],
        ),
      ),
    );
  }

  Container _flagContainer() {
    return Container(
      height: 200,
      width: 300,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/flag.png'), fit: BoxFit.cover),
      ),
    );
  }

  Container _questionContainer() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _questionText(),
          _optionView(),
        ],
      ),
    );
  }

  Container _questionText() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      margin: const EdgeInsets.only(top: 20.0, bottom: 30.0),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14.4),
          border: Border.all(
            color: Colors.blueGrey.shade400,
          )),
      height: 200.0,
      child: Center(
        child: Text(
          questionBank[_currentQuestionIndex].questionText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Builder _optionView() {
    return Builder(
      builder: (BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonTheme(
            minWidth: 30.0,
            height: 40.0,
            child: RaisedButton(
              onPressed: () => _prevQuestion(),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          ButtonTheme(
            minWidth: 40.0,
            height: 40.0,
            child: RaisedButton(
              onPressed: () => _checkAnswer(true, context),
              child: Text(
                'TRUE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ButtonTheme(
            minWidth: 40.0,
            height: 40.0,
            child: RaisedButton(
              onPressed: () => _checkAnswer(false, context),
              child: Text(
                'FALSE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ButtonTheme(
              minWidth: 30.0,
              height: 40.0,
              child: RaisedButton(
                onPressed: () => _nextQuestion(),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }

  void _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }

  void _nextQuestion() {
    _updateQuestion();
  }

  void _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  void _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final SnackBar snackbar = SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 500),
        content: Text('Correct!'));
      Scaffold.of(context).showSnackBar(snackbar);
    } else {
      final SnackBar snackbar = SnackBar(
        backgroundColor: Colors.redAccent,
        duration: Duration(milliseconds: 500),
        content: Text('Incorrect!'));
      Scaffold.of(context).showSnackBar(snackbar);
    }
    _updateQuestion();
  }
}
