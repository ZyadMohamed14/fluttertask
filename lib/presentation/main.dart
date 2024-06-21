import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/home/screen/home_screen.dart';

import '../data/repository/product_repo.dart';
import '../data/services/product_services.dart';
import '../domain/state/product_cubit.dart';
import 'nav_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late ProductCubit productCubit;
  late ProductRepository productRepository;
  MyApp(){
    productRepository = ProductRepository(ProductServices());
    productCubit =ProductCubit(productRepository);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ProductCubit(productRepository),
        child: BottomNavBar(),
      ),
    );

  }
}