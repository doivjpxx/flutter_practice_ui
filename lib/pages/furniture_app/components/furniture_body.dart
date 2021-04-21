import 'package:flutter/material.dart';
import 'package:flutter_practice_ui/pages/furniture_app/components/category_card.dart';
import 'package:flutter_practice_ui/pages/furniture_app/components/product_card.dart';
import 'package:flutter_practice_ui/pages/furniture_app/components/title_text.dart';
import 'package:flutter_practice_ui/pages/furniture_app/models/categories.dart';
import 'package:flutter_practice_ui/pages/furniture_app/models/product.dart';
import 'package:flutter_practice_ui/pages/furniture_app/screens/detail_screen.dart';
import 'package:flutter_practice_ui/pages/furniture_app/services/catogory.dart';
import 'package:flutter_practice_ui/pages/furniture_app/services/product.dart';

import '../size_config.dart';

class FurnitureBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(title: "Browse by Categogies")),
          FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? CategoriesSection(
                      categories: snapshot.data,
                    )
                  : Center(child: Image.asset("assets/ripple.gif"))),
          Divider(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(defaultSize * 2),
            child: TitleText(
              title: "Recommended for you",
            ),
          ),
          FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) => snapshot.hasData
                  ? RecommendedProducts(
                      products: snapshot.data,
                    )
                  : Center(
                      child: Image.asset("assets/ripple.gif"),
                    ))
        ],
      ),
    );
  }
}

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final double defaultSize = SizeConfig.defaultSize;

    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  SizeConfig.orientation == Orientation.portrait ? 2 : 4,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          itemBuilder: (context, index) => ProductCard(
                product: products[index],
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              DetailScreen(product: products[index])));
                },
              )),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key key, this.categories}) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
        categories.length,
        (index) => CategoryCard(
          category: categories[index],
        ),
      )),
    );
  }
}
