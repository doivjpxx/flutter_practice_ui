import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/bagshop_app/components/utils.dart';
import 'package:flutter_practice_ui/pages/bagshop_app/constants.dart';
import 'package:flutter_practice_ui/pages/bagshop_app/models/product.dart';
import 'package:flutter_svg/svg.dart';

class DetailBagPage extends StatelessWidget {
  final Product product;

  DetailBagPage({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildDetailAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: size.height * 0.12,
                        left: kDefaultPaddin,
                        right: kDefaultPaddin),
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    child: Column(
                      children: <Widget>[
                        ColorAndSize(product: product),
                        SizedBox(
                          height: kDefaultPaddin / 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPaddin),
                          child: Text(
                            product.description,
                            style: TextStyle(height: 1.5),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CartCounter(),
                            Container(
                              padding: const EdgeInsets.all(8),
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF6464),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset("assets/icons/heart.svg"),
                            )
                          ],
                        ),
                        AddToCart(product: product)
                      ],
                    ),
                  ),
                  ProductTitleWithImage(product: product),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildDetailAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {}),
        IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"), onPressed: () {}),
        const SizedBox(
          width: kDefaultPaddin / 2,
        )
      ],
    );
  }
}

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: product.color)),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                color: product.color,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                onPressed: () {},
                color: product.color,
                child: Text(
                  "Buy Now".toUpperCase(),
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
            icon: Icons.remove,
            onPressed: () {
              setState(() {
                if (numOfItems > 1) {
                  numOfItems -= 1;
                }
              });
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            numOfItems.toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            onPressed: () {
              setState(() {
                numOfItems += 1;
              });
            }),
      ],
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function onPressed}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }
}
