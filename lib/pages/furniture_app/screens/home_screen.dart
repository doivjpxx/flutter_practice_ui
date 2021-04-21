import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/furniture_app/components/furniture_body.dart';
import 'package:flutter_practice_ui/pages/furniture_app/constants.dart';
import 'package:flutter_practice_ui/pages/furniture_app/size_config.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // helpful to responsive app
    SizeConfig().init(context);

    return Scaffold(
      appBar: buildAppBar(),
      body: FurnitureBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/menu.svg",
          height: SizeConfig.defaultSize * 2,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
            icon: SvgPicture.asset(
              "assets/icons/scan.svg",
              height: SizeConfig.defaultSize * 2.4,
            ),
            onPressed: () {}),
        Center(
          child: Text(
            "Scan",
            style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: SizeConfig.defaultSize,
        )
      ],
    );
  }
}
