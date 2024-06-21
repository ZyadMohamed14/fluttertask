import 'package:flutter/material.dart';
import 'package:task/presentation/home/widget/product_item.dart';

import '../../../data/models/product_model.dart';
import 'SectionHeader.dart';

class Section extends StatelessWidget {
  final String title;
  final List<Product> products;

  const Section({Key? key, required this.title, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.25;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title),
        SizedBox(height: 8.0),
        if (products.isNotEmpty)
          SizedBox(
            height: height,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductItem(
                  image: product.image,
                  name: product.name,
                  price: 'EGP ${product.price}',
                );
              },
            ),
          ),
        if (products.isEmpty)
          Center(child: Text('No products available')),
      ],
    );
  }
}
