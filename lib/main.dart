import 'package:flutter/material.dart';
import 'package:theme_app/ui/quiz_screen.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
      brightness: Brightness.dark,
      accentColor: Colors.red[500],
      primaryColor: Colors.red[500],
      scaffoldBackgroundColor: Colors.grey[400],
      backgroundColor: Colors.red[500],
      buttonTheme: ButtonThemeData(
      ),
      textTheme: _appTextTheme(base.textTheme),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.orange,
          backgroundColor: Colors.orange,
        ),
      )
  );
}

TextTheme _appTextTheme(TextTheme base) {
  return base
      .copyWith(
          headline5: base.headline5.copyWith(
            fontWeight: FontWeight.w500,
          ),
          headline6: base.headline6
              .copyWith(fontSize: 18.0, fontStyle: FontStyle.italic),
          caption: base.caption
              .copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
          button: base.button.copyWith(
              fontSize: 18.0,
          ),
          bodyText1: base.bodyText1.copyWith(
            fontSize: 16.0,
            fontFamily: "Lobster",
            color: Colors.white,
          ))
      .apply(
          fontFamily: "Lobster",
          bodyColor: Colors.red,
          displayColor: Colors.red,
      );
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuizScreen(),
    theme: _appTheme,
  ));
}
