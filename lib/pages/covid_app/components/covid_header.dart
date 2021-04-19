import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/covid_app/pages/info_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class CovidHeader extends StatelessWidget {
  const CovidHeader({Key key, this.image, this.title}) : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: const EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFF3383CD), Color(0xFF11249F)]),
            image:
                DecorationImage(image: AssetImage("assets/images/virus.png"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CovidInfoPage()));
              },
              child: Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset("assets/icons/menu.svg")),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Stack(
              children: <Widget>[
                SvgPicture.asset(
                  image,
                  width: 200,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
                Positioned(
                    top: 20,
                    left: 150,
                    child: Text(
                      title,
                      style: kHeadingTextStyle.copyWith(color: Colors.white),
                    )),
                // this is a trick if the text has cutting
                Container()
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
