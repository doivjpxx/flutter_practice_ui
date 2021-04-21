import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/furniture_app/models/product.dart';
import 'package:flutter_practice_ui/pages/furniture_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final double defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6));

    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
      height: defaultSize * 37.5,
      width: defaultSize *
          (SizeConfig.orientation == Orientation.landscape ? 35 : 15),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              product.category.toUpperCase(),
              style: lightTextStyle,
            ),
            SizedBox(
              height: defaultSize,
            ),
            Text(
              product.title,
              style: TextStyle(
                  fontSize: defaultSize * 2.4,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.8,
                  height: 1.4),
            ),
            SizedBox(
              height: defaultSize * 2,
            ),
            Text(
              "Form",
              style: lightTextStyle,
            ),
            Text(
              "\$${product.price}",
              style: TextStyle(
                  fontSize: defaultSize * 1.6,
                  fontWeight: FontWeight.bold,
                  height: 1.6),
            ),
            SizedBox(
              height: defaultSize * 2,
            ),
            Text(
              "Available Colors",
              style: lightTextStyle,
            ),
            Row(
              children: <Widget>[
                buildColorBox(color: Color(0xFF7BA275), isActive: true),
                buildColorBox(color: Color(0xFFD7D7D7)),
                buildColorBox(color: kTextColor),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildColorBox({Color color, bool isActive = false}) {
    final double defaultSize = SizeConfig.defaultSize;
    return Container(
      margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
      padding: const EdgeInsets.all(5),
      height: defaultSize * 2.4,
      width: defaultSize * 2.4,
      decoration: BoxDecoration(
        color: color, //,
        borderRadius: BorderRadius.circular(6),
      ),
      child: isActive ? SvgPicture.asset("assets/icons/check.svg") : SizedBox(),
    );
  }
}