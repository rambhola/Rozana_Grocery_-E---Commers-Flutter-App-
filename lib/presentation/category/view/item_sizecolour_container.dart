import 'package:get/get.dart';


class ItemSizeColourContainer extends GetxController {
  RxInt selectedIndex = (-1).obs;

  void selectContainer(int index) {
    selectedIndex.value = selectedIndex.value == index ? -1 : index;
  }
}
