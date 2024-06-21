import 'package:flutter/material.dart';

import 'SectionHeader.dart';
import 'category_item.dart';

class CategoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Categories'),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CategoryItem(icon: 'assets/images/fashionIcon.png', label: 'Fashion'),
            CategoryItem(icon: "assets/images/gameicon.png", label: 'Games'),
            CategoryItem(
                icon: 'assets/images/accsicon.png', label: 'Accessories'),
            CategoryItem(icon: 'assets/images/bookicon.png', label: 'Books'),
          ],
        ),
      ],
    );
  }
}
