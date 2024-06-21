import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/product_model.dart';
import '../services/product_services.dart';

class ProductRepository {
final ProductServices productServices;

ProductRepository(this.productServices);


  Future<List<Product>> getAllProducts() async {
  final products = await productServices.getProducts();
  return products;
}
Future<List<Product>> getRecommendedProducts() async {
  final products = await productServices.getRecommendedProducts();


  return products;
}
Future<List<Product>> getNewArrivalProducts() async {
  final products = await productServices.getNewArrivalProducts();


  return products;
}
Future<List<Product>> getBestSellingProducts() async {
  final products = await productServices.getBestSellingProducts();
  return products;
}

}
