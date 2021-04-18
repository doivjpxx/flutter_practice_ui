import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/plant_app/plant_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Practise UI', initialRoute: '/', routes: {
      '/': (_) => MyPlantApp(),
    });
  }
}
