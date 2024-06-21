import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/extention/data_extention.dart';

import '../../../domain/state/product_cubit.dart';
import '../widget/banner.dart';
import '../widget/category_section.dart';
import '../widget/section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   BlocProvider.of<ProductCubit>(context).getAllProducts();

  }

  Widget buildBlocBuilder() {
    setState(() {});
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial) {

          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchBar(),
                  BannerSection(),
                  CategoriesSection(),
                  Section(title:'best Selling', products: state.bestSaleProducts.repeat(2),),
                  Section(title:'New Arrival', products: state.arrivalProducts.repeat(2),),
                  Section(title:'Recommended For You', products: state.recommendedProducts.repeat(2),),
                
                ],
              ),
            ),
          );
        } else {
          return const Center(child: Text('Failed to load products'));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Slash',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_on),
                  Text(
                    'Cairo, Nasr City',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      // Handle location selection logic here
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined,color: Colors.black,),
            onPressed: () {
              // Handle notification icon tap logic here
            },
          ),
        ],
      ),
      body: buildBlocBuilder(),
    );
  }
}



class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          SizedBox(width: 8.0),
          const ImageIcon(AssetImage('assets/images/sildericon.png'),size: 47,),// Add spacing between TextField and Icon

        ],
      ),
    );
  }
}







