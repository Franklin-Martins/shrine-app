import 'package:flutter/material.dart';

import '../model/product.dart';
import 'product_card.dart';

class TwoProductCardColumn extends StatelessWidget {
  final Product bottom;
  final Product? top;

  const TwoProductCardColumn({required this.bottom, this.top, Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        const spacerHeight = 44.0;
        double heightOfCards = (constraints.biggest.height - spacerHeight) / 2.0;
        double heightOfImages = heightOfCards - ProductCard.kTextBoxHeight;
        double imageAspectRatio = constraints.biggest.width / heightOfImages;

        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 28.0),
              child: top!=null
              ? ProductCard(
                imageAspectRatio: imageAspectRatio,
                product: top!,
              )
              : SizedBox(height: heightOfCards,)
            ),
            const SizedBox(height: spacerHeight,),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 28.0),
              child: ProductCard(
                imageAspectRatio: imageAspectRatio,
                product: bottom,
              ),
            )
          ],
        );
      },
    );
  }
}

class OneProductCardColumn extends StatelessWidget {
  final Product product;
  const OneProductCardColumn({required this.product ,Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ProductCard(product: product),
        const SizedBox(height: 40.0,)
      ],
    );
  }
}