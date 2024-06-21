import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  ProductItem({
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth * 0.4;
        double height = constraints.maxHeight * 0.6;

        return Container(
          margin: EdgeInsets.only(right: 8.0),
          width: constraints.maxWidth < 600 ? width : 120,
          height: constraints.maxWidth < 600 ? height : 120,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: _buildProductImage(),
                  ),
                  SizedBox(height: 4.0),
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price),
                      SizedBox(width: 15),
                      Icon(Icons.shop_2_outlined, size: 10, color: Colors.blue),
                      Icon(Icons.add, size: 10),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 4.0,
                right: 4.0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 13.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProductImage() {
    String resolvedImagePath = image;
    if (image.endsWith('recommended_4.png')) {
      resolvedImagePath = 'assets/images/recommended_1.png';
    }

    return Image.asset(
      resolvedImagePath,
      height: 120.0,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

