import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/plant_app/constants.dart';

import 'pages/home_screen.dart';

class MyPlantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Plant App',
        theme: ThemeData(
            scaffoldBackgroundColor: kBackgroundColor,
            primaryColor: kPrimaryColor,
            textTheme:
                Theme.of(context).textTheme.apply(bodyColor: kTextColor)),
        home: HomeScreen());
  }
}
