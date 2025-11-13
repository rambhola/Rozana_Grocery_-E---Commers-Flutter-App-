


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rozana_grocery_app/repository/Screens/Login/login_screen.dart';

//
// void main() async {
//
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }
void main(){
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
            return const GetMaterialApp(
              useInheritedMediaQuery: true, // ensures correct adaptive scaling
              debugShowCheckedModeBanner: false,
              home: LoginScreen(), // or HomeScreen() for testing
            );
          },
        );
      },
    );
  }
}
