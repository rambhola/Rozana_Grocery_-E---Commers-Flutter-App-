import 'package:flutter/material.dart';
import 'package:rozana_grocery_app/presentation/category/view/see_all_products_list_screen.dart';
import 'package:rozana_grocery_app/presentation/profile/view/profile_screen.dart';
import '../../core/widgets/ui_helper.dart';
import '../cart/view/cart_screen.dart';
import '../home/view/home_screen.dart';


class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;


  // lites of the all pages to navigates
  List<Widget> pages = [
    HomeScreen(address: 'address', newAddress: 'newAddress',),
    SeeAllProductsListScreen(address: '', newAddress: ''),
    CartScreen(),
    ProfileScreen(),
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
              label: 'Profile'
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
