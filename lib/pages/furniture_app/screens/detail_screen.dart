import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/furniture_app/components/product_detail_body.dart';
import 'package:flutter_practice_ui/pages/furniture_app/constants.dart';
import 'package:flutter_practice_ui/pages/furniture_app/models/product.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key key, this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(context),
      body: ProductDetailBody(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset("assets/icons/bag.svg"), onPressed: () {})
      ],
    );
  }
}
