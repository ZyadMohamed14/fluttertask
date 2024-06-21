import 'package:flutter/material.dart';
import 'package:task/presentation/home/widget/SectionHeader.dart';
import 'package:task/presentation/home/widget/product_item.dart';

import '../../../data/models/product_model.dart';

class NewArrivalSection extends StatelessWidget {
  final List<Product> newArrivalProducts;

  const NewArrivalSection({Key? key, required this.newArrivalProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'New Arrival'),
        SizedBox(height: 8.0),
        if (newArrivalProducts.isNotEmpty)
          SizedBox(
            height: 200, // Adjust the height based on your design
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: newArrivalProducts.length,
              itemBuilder: (context, index) {
                final product = newArrivalProducts[index];
                return ProductItem(
                  image: product.image,
                  name: product.name,
                  price: 'EGP ${product.price}',
                );
              },
            ),
          ),
        if (newArrivalProducts.isEmpty)
          Center(child: Text('No recommended products yet')),
      ],
    );
  }
}
