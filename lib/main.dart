import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/bagshop_app/bagshop_app.dart';
import 'package:flutter_practice_ui/pages/covid_app/main_page.dart';
import 'package:flutter_practice_ui/main_page.dart';
import 'package:flutter_practice_ui/pages/furniture_app/furniture_main.dart';
import 'package:flutter_practice_ui/pages/plant_app/plant_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Practise UI', initialRoute: '/', routes: {
      '/': (_) => MyMainPage(),
      '/first': (_) => MyPlantApp(),
      '/second': (_) => MyCovidAppPage(),
      '/third': (_) => BagShopApp(),
      '/four': (_) => FurnitureMainApp()
    });
  }
}
