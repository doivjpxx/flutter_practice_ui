import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/covid_app/components/covid_header.dart';
import 'package:flutter_practice_ui/pages/covid_app/constants.dart';
import 'package:flutter_svg/svg.dart';

class CovidInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          CovidHeader(
            image: "assets/icons/coronadr.svg",
            title: "Get to know \nAbout Covid-19",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Symptoms",
                  style: kTitleTextstyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SymptomCard(
                      image: "assets/images/headache.png",
                      title: "Headache",
                      isActive: true,
                    ),
                    SymptomCard(
                      image: "assets/images/caugh.png",
                      title: "Caugh",
                    ),
                    SymptomCard(
                      image: "assets/images/fever.png",
                      title: "Fever",
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Prevention",
                  style: kTitleTextstyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                PreventCard(
                  image: "assets/images/wear_mask.png",
                  title: "Wear face mask",
                  subTitle:
                      "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                ),
                PreventCard(
                  image: "assets/images/wash_hands.png",
                  title: "Wash your hands",
                  subTitle:
                      "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.subTitle,
  }) : super(key: key);

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 24,
                        color: kShadowColor)
                  ]),
            ),
            Image.asset(image),
            Positioned(
                left: 130,
                child: Container(
                  height: 136,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  width: MediaQuery.of(context).size.width - 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        style: kTitleTextstyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(fontSize: 12),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset("assets/icons/forward.svg"),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  const SymptomCard({Key key, this.title, this.image, this.isActive = false})
      : super(key: key);

  final String image;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            isActive
                ? BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 20,
                    color: kActiveShadowColor)
                : BoxShadow(
                    offset: Offset(0, 3), blurRadius: 6, color: kShadowColor)
          ]),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 90,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
