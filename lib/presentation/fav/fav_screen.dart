import 'package:flutter/material.dart';

class FavScreen extends StatelessWidget {
  String resolvedImagePath ='assets/images/recommended_1.png';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image from Assets'),
        ),
        body: Center(
          child: Image.asset(resolvedImagePath),
        ),
      ),
    );
  }

}