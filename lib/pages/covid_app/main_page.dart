import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/covid_app/constants.dart';
import 'package:flutter_practice_ui/pages/covid_app/pages/home_page.dart';
import 'package:flutter_practice_ui/pages/covid_app/pages/info_page.dart';

class MyCovidAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid app',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: TextTheme(body1: TextStyle(color: kBodyTextColor)),
      ),
      home: CovidHomePage(),
    );
  }
}
