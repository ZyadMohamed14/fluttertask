import 'package:flutter/material.dart';
import 'package:task/presentation/home/widget/product_item.dart';

import '../../../data/models/product_model.dart';
import '../screen/home_screen.dart';
import 'SectionHeader.dart';

class RecommendedSection extends StatelessWidget {
  final List<Product> recommendProducts;

  const RecommendedSection({Key? key, required this.recommendProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Recommended for you'),
        SizedBox(height: 8.0),
        if (recommendProducts.isNotEmpty)
          SizedBox(
            height: 200, // Adjust the height based on your design
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: recommendProducts.length,
              itemBuilder: (context, index) {
                final product = recommendProducts[index];
                return ProductItem(
                  image: product.image,
                  name: product.name,
                  price: 'EGP ${product.price}',
                );
              },
            ),
          ),
        if (recommendProducts.isEmpty)
          Center(child: Text('No recommended products yet')),
      ],
    );
  }
}
