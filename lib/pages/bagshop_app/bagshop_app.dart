import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/bagshop_app/pages/home_page.dart';
import 'package:flutter_practice_ui/pages/plant_app/constants.dart';

class BagShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bag shop app',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyBagShopHomePage(),
    );
  }
}
