import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rozana_grocery_app/auth/view/phone_auth.dart';
import 'package:rozana_grocery_app/presentation/cart/view_model/cart_controller.dart';
import 'package:rozana_grocery_app/presentation/category/view_model/favorites_controller.dart';
import 'package:rozana_grocery_app/presentation/category/view_model/quantity_controller.dart';
import 'package:rozana_grocery_app/presentation/home/view/home_screen.dart';
import 'package:rozana_grocery_app/presentation/navbar/view/bottom_navbar.dart';
import 'package:rozana_grocery_app/presentation/navbar/view_model/nevbaar_change_color.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //This ensures the controller is created globally before any screen loads.
  Get.put(CartController());
  Get.put(FavoritesController());
  Get.put(NavColourContainer());
  Get.put(QuantityController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Dynamically adjust design size for portrait & landscape
        return ScreenUtilInit(
          designSize: const Size(393, 852), // Standard modern mobile reference
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              initialRoute: '/phoneAuth',
              getPages: [
                GetPage(
                  name: '/home',
                  page: () => BottomNavbar(),
                ),
                GetPage(name: '/phoneAuth', page: () => PhoneAuth()),
              ],
              useInheritedMediaQuery: true, // ensures correct adaptive scaling
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}