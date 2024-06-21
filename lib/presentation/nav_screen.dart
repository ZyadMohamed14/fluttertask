
import 'package:flutter/material.dart';
import 'package:task/presentation/fav/fav_screen.dart';
import 'cart/cart_screen.dart';
import 'home/screen/home_screen.dart';
import 'profile/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int cuttentIndex =0;
  List screens =  [

    HomeScreen(),
    FavScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [

                IconButton(
                  onPressed: () {

                    setState(() {
                      cuttentIndex = 0;
                    });
                  },
                  icon: Icon(
                    Icons.home,
                    size: 30,
                    color: cuttentIndex == 0 ? Colors.grey : Colors.grey.shade400,
                  ),
                ),

            IconButton(
              onPressed: () {
                setState(() {
                  cuttentIndex = 1;
                });
              },
              icon: Icon(
                Icons.favorite_border,
                size: 30,
                color: cuttentIndex == 1 ? Colors.grey : Colors.grey.shade400,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  cuttentIndex = 2;


                });
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
                color: cuttentIndex == 2 ? Colors.grey : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  cuttentIndex = 3;
                });
              },
              icon: Icon(
                Icons.person,
                size: 30,
                color: cuttentIndex == 3 ? Colors.grey : Colors.grey.shade400,
              ),
            ),
          ],
        ),

      ),
      body: screens[cuttentIndex],
    );
  }

  Widget buildBottomNavItem(IconData icon, String label, int index) {
    return IconButton(
      onPressed: () {
        setState(() {
          cuttentIndex = index;
        });
      },
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 30,
            color: cuttentIndex == index ? Colors.grey : Colors.grey.shade400,
          ),
          Text(
            label,
            style: TextStyle(
              color: cuttentIndex == index ? Colors.grey : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}


