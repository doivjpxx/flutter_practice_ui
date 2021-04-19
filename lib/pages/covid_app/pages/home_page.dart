import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/covid_app/components/covid_header.dart';
import 'package:flutter_practice_ui/pages/covid_app/constants.dart';
import 'package:flutter_svg/svg.dart';

class CovidHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CovidHeader(
              image: "assets/icons/Drcorona.svg",
              title: "All you need \nis stay at home."),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xFFE5E5E5))),
            child: Row(
              children: <Widget>[
                SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                const SizedBox(width: 20),
                Expanded(
                    child: DropdownButton(
                  isExpanded: true,
                  value: 'Indonesia',
                  underline: const SizedBox(),
                  icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                  items: ['Indonesia', 'Banladesh', 'US']
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        ),
                      )
                      .toList(),
                  onChanged: (value) {},
                ))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(text: "Case Update\n", style: kTitleTextstyle),
                      TextSpan(
                          text: "Newest update March 28",
                          style: TextStyle(color: kTextLightColor))
                    ])),
                    Text(
                      "See details",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 30,
                            color: kShadowColor)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Counter(
                        number: 1046,
                        title: "Infected",
                        color: kInfectedColor,
                      ),
                      Counter(
                        color: kDeathColor,
                        title: "Deaths",
                        number: 87,
                      ),
                      Counter(
                        color: kRecovercolor,
                        title: "Recovered",
                        number: 46,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Spread of Virus",
                  style: kTitleTextstyle,
                ),
                Text(
                  "See details",
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Container(
              height: 178,
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 30,
                        color: kShadowColor)
                  ]),
              child: Image.asset(
                "assets/images/map.png",
                fit: BoxFit.contain,
              ))
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({Key key, this.color, this.title, this.number})
      : super(key: key);

  final String title;
  final Color color;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 25,
          width: 25,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: color.withOpacity(0.26)),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: color, width: 2)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          number.toString(),
          style: TextStyle(color: color, fontSize: 40),
        ),
        Text(
          title,
          style: kSubTextStyle,
        )
      ],
    );
  }
}
