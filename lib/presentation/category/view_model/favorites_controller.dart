import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  var isFavorite = false.obs;
  RxInt selectedIndex = (-1).obs;

  void toggleFavorites() {
    isFavorite.value = !isFavorite.value;
  }

  void selectContainer(int index) {
    selectedIndex.value = selectedIndex.value == index ? -1 : index;
  }
}
