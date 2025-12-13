import 'package:get/get.dart';

import '../view/bottom_navbar.dart';

class NavColourContainer extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxInt cartBadge = 0.obs;

  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = 0;
  }

  void selectContainer(int index) {
    selectedIndex.value = index;
  }

  void updateCartBadge(int count) {
    cartBadge.value = count;
  }

  void backToHome() {
    selectedIndex.value = 0;
    Get.offAll(() => BottomNavbar());
  }
  @override
  void onClose() {
    super.onClose();
    // Prevent dispose if needed
  }

}
