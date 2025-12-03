import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityController extends GetxController {
  var quantity = 0.obs;
  Rx<Color> bgColor = const Color(0xFF2e6767).obs; // Fixed initial Color3

  void increment() {
    quantity.value++;
    updateColor();
  }

  void decrement() {
    if (quantity.value > 0) {
      quantity.value--;
      updateColor();
    }
  }

  void updateColor() {
    bgColor.value = quantity.value > 0
        ? const Color(0xFF00A86B)
        : const Color(0xFFe53935);
  }

}
