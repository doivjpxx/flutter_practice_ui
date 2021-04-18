import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/plant_app/components/body.dart';
import 'package:flutter_practice_ui/pages/plant_app/components/bottom_navbar.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {},
        ),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
