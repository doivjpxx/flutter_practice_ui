import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/bagshop_app/components/cart_body.dart';
import 'package:flutter_practice_ui/pages/bagshop_app/constants.dart';
import 'package:flutter_svg/svg.dart';

class MyBagShopHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: CartBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
            color: kTextColor,
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {}),
        IconButton(
            color: kTextColor,
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            onPressed: () {}),
        const SizedBox(
          width: kDefaultPaddin / 2,
        )
      ],
    );
  }
}
