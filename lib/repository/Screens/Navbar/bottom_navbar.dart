import 'package:flutter/material.dart';

import '../../widgets/ui_helper.dart';
import '../Cart/cart_screen.dart';
import '../Category/category_screen.dart';
import '../Home/home_screen.dart';
import '../Print/print_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;

  // lites of the all pages to navigates
  List<Widget> pages = [
    HomeScreen(address: 'address',),
    CategoryScreen(),
    CartScreen(),
    PrintScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: UiHelper.customImage(img: 'home 1.png'),
              label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: UiHelper.customImage(img: 'category 1.png'),
              label: 'Category'
          ),
          BottomNavigationBarItem(
            icon: UiHelper.customImage(img: 'shopping-bag 1.png'),
              label: 'Cart'
          ),
          BottomNavigationBarItem(
            icon: UiHelper.customImage(img: 'printer 1.png'),
              label: 'Print'
          ),

        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,onTap: (index) {
          setState(() {
            currentIndex=index;
          });
        },

      ),
    );
  }
}
