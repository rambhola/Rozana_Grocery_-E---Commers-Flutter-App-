import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rozana_grocery_app/presentation/category/view/see_all_products_list_screen.dart';
import 'package:rozana_grocery_app/presentation/navbar/view_model/nevbaar_change_color.dart';
import 'package:rozana_grocery_app/presentation/profile/view/profile_screen.dart';
import '../../../core/widgets/ui_helper.dart';
import '../../address/controllers/addressController.dart';
import '../../cart/view/cart_screen.dart';
import '../../cart/view_model/cart_controller.dart';
import '../../home/view/home_screen.dart';

class BottomNavbar extends StatelessWidget {
  int? navIndex;
 BottomNavbar({super.key,this.navIndex});

  @override
  Widget build(BuildContext context) {

    final NavColourContainer navController =
    Get.isRegistered<NavColourContainer>()
        ? Get.find<NavColourContainer>()
        : Get.put(NavColourContainer());

    final CartController cartController =
    Get.isRegistered<CartController>()
        ? Get.find<CartController>()
        : Get.put(CartController());

    if (navIndex != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        navController.selectContainer(
          navIndex!.clamp(0, 3),
        );
      });
    }
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: navController.selectedIndex.value.clamp(0, 3),
        children: [
          HomeScreen(),
          SeeAllProductsListScreen(address: Get.find<AddressController>().usersAddress.value, ),
          CartScreen(),
          ProfileScreen(),
        ],
      )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navController.selectedIndex.value.clamp(0, 3),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Color(0xff3c8c52),
        elevation: 8,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) => navController.selectContainer(index),
        items: [
          BottomNavigationBarItem(
            icon: Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: navController.selectedIndex.value == 0
                    ? Colors.white.withOpacity(0.2)
                    : Colors.transparent,
              ),
              child: Center(child: UiHelper.customImage(img: 'home_24px.png')),
            ),
            activeIcon: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(child: UiHelper.customImage(img: 'home_24px.png')),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: navController.selectedIndex.value == 1
                    ? Colors.white
                    : Colors.transparent,
              ),
              child: Center(child: UiHelper.customImage(img: 'categories_24px.png')),
            ),
            activeIcon: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(child: UiHelper.customImage(img: 'categories_24px.png')),
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: navController.selectedIndex.value == 2
                        ? Colors.white
                        : Colors.transparent,
                  ),
                  child: Center(child: UiHelper.customImage(img: 'Cart.png')),
                ),
                if (cartController.cartItems.isNotEmpty)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: Text(
                        '${cartController.cartItems.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            activeIcon: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(child: UiHelper.customImage(img: 'Cart.png')),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: navController.selectedIndex.value == 3
                    ? Colors.white
                    : Colors.transparent,
              ),
              child: Center(child: UiHelper.customImage(img: 'Menu.png')),
            ),
            activeIcon: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(child: UiHelper.customImage(img: 'Menu.png')),
            ),
            label: 'Menu',
          ),
        ],
      )),
    );
  }
}
