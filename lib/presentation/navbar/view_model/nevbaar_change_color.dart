import 'package:get/get.dart';

class NavColourContainer extends GetxController{

  RxInt selectedIndex = 0.obs;  // Start with Home (0)
  RxInt cartBadge = 0.obs;     // Cart badge support

  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = 0;  // Home initially selected
  }

  void selectContainer(int index) {
    selectedIndex.value = index;
  }

  void updateCartBadge(int count) {
    cartBadge.value = count;
  }

}