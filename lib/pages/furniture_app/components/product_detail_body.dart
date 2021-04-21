import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/furniture_app/components/product_info.dart';
import 'package:flutter_practice_ui/pages/furniture_app/constants.dart';
import 'package:flutter_practice_ui/pages/furniture_app/models/product.dart';
import 'package:flutter_practice_ui/pages/furniture_app/size_config.dart';

class ProductDetailBody extends StatelessWidget {
  final Product product;

  const ProductDetailBody({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight - AppBar().preferredSize.height,
        child: Stack(
          children: <Widget>[
            ProductInfo(product: product),
            Positioned(
              top: defaultSize * 37.5,
              left: 0,
              right: 0,
              child: ProductDescription(
                product: product,
                onPressed: () {},
              ),
            ),
            Positioned(
                top: defaultSize * 9.5,
                right: -defaultSize * 7.5,
                child: Hero(
                  tag: "${product.id}",
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                    height: defaultSize * 37.8,
                    width: defaultSize * 36.4,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key key, @required this.product, this.onPressed})
      : super(key: key);

  final Product product;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final double defaultSize = SizeConfig.defaultSize;
    return Container(
      constraints: BoxConstraints(minHeight: defaultSize * 44),
      padding: EdgeInsets.only(
        top: defaultSize * 9,
        left: defaultSize * 2,
        right: defaultSize * 2,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultSize * 1.2),
              topRight: Radius.circular(defaultSize * 1.2))),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              product.subTitle,
              style: TextStyle(
                  fontSize: defaultSize * 1.8, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: defaultSize * 3,
            ),
            Text(product.description),
            SizedBox(
              height: defaultSize * 3,
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.all(defaultSize * 1.5),
                onPressed: onPressed,
                textColor: Colors.white,
                child: Text(
                  "Add to cart",
                  style: TextStyle(
                      fontSize: defaultSize * 1.6, fontWeight: FontWeight.bold),
                ),
                color: kPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
