import 'package:flutter/material.dart';
import 'package:task/data/models/product_model.dart';
import 'package:task/presentation/home/widget/product_item.dart';

import 'SectionHeader.dart';

class BestSellingSection extends StatelessWidget {
  final List<Product> bestSaleingProducts;

  const BestSellingSection({Key? key, required this.bestSaleingProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Best Selling'),
        SizedBox(height: 8.0),
        if (bestSaleingProducts.isNotEmpty)
          SizedBox(
            height: 200, // Adjust the height based on your design
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: bestSaleingProducts.length,
              itemBuilder: (context, index) {
                final product = bestSaleingProducts[index];
                return ProductItem(
                  image: product.image,
                  name: product.name,
                  price: 'EGP ${product.price}',
                );
              },
            ),
          ),
        if (bestSaleingProducts.isEmpty)
          Center(child: Text('No recommended products yet')),
      ],
    );
  }
}
