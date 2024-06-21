import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/product_model.dart';

class ProductServices {
  Future<List<Product>> getProducts() async {
    final response = await rootBundle.loadString('assets/dummyData.json');
    final data = json.decode(response) as Map<String, dynamic>;

    List<Product> bestSelling = (data['bestSelling'] as List)
        .map((item) => Product.fromJson(item))
        .toList();

    List<Product> newArrival = (data['newArrival'] as List)
        .map((item) => Product.fromJson(item))
        .toList();
    List<Product> recommendedForYou = (data['recommendedForYou'] as List)
        .map((item) => Product.fromJson(item))
        .toList();

    return bestSelling + newArrival + recommendedForYou;
  }

  Future<List<Product>> getRecommendedProducts() async {
    final response = await rootBundle.loadString('assets/dummyData.json');
    final data = json.decode(response) as Map<String, dynamic>;

    List<Product> recommendedForYou = (data['recommendedForYou'] as List)
        .map((item) => Product.fromJson(item))
        .toList();

    return recommendedForYou;
  }

  Future<List<Product>> getNewArrivalProducts() async {
    final response = await rootBundle.loadString('assets/dummyData.json');
    final data = json.decode(response) as Map<String, dynamic>;

    List<Product> newArrivals = (data['newArrival'] as List)
        .map((item) => Product.fromJson(item))
        .toList();

    return newArrivals;
  }

  Future<List<Product>> getBestSellingProducts() async {
    final response = await rootBundle.loadString('assets/dummyData.json');
    final data = json.decode(response) as Map<String, dynamic>;

    List<Product> recommendedForYou = (data['bestSelling'] as List)
        .map((item) => Product.fromJson(item))
        .toList();

    return recommendedForYou;
  }
}
