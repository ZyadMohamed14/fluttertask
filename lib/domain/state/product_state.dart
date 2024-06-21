part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoaded extends ProductState{
  final List<Product>products;
  final List<Product>recommendedProducts;
  final List<Product>arrivalProducts ;
  final List<Product>bestSaleProducts;
  ProductLoaded(this.products, this.recommendedProducts, this.arrivalProducts, this.bestSaleProducts);
}
