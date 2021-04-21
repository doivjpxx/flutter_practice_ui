import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/furniture_app/constants.dart';
import 'package:flutter_practice_ui/pages/furniture_app/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FurnitureMainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Furniture app',
        theme: ThemeData(
            backgroundColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: AppBarTheme(
                color: Colors.transparent,
                elevation: 0,
                brightness: Brightness.light),
            textTheme:
                GoogleFonts.dmSansTextTheme().apply(displayColor: kTextColor)),
        home: HomeScreen());
  }
}
