import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../extention/constatns.dart';

class CategoryItem extends StatelessWidget {
  final String icon;
  final String label;

  CategoryItem({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: categoryItemColor,
          ),
          padding: EdgeInsets.all(12.0),
          child: ImageIcon(
            AssetImage(icon),
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
