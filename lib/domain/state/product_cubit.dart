import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/data/repository/product_repo.dart';

import '../../data/models/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;
  List<Product>products = [];
  List<Product>recommendedProducts = [];
  List<Product>arrivalProducts = [];
  List<Product>bestSaleProducts = [];
  ProductCubit(this.productRepository) : super(ProductInitial());

  void getAllProducts() async {
    try {
      final allProducts = await productRepository.getAllProducts();
      final recommendedProducts = await productRepository.getRecommendedProducts();
      final arrivalProducts = await productRepository.getNewArrivalProducts();
      final bestSaleProducts = await productRepository.getBestSellingProducts();
      emit(ProductLoaded(allProducts, recommendedProducts, arrivalProducts, bestSaleProducts));
    } catch (e) {
      // Handle error state if needed
      // emit(ProductError(e.toString()));
    }
  }

}
