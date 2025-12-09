import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityController extends GetxController {
  // Quantity observable
  RxInt quantity = 1.obs;

  // Price per item
  double pricePerItem = 749.0;

  // Background color observable (changes based on quantity)
  Rx<Color> bgColor = const Color(0xFF2e6767).obs;

  // Computed total price
  double get totalPrice => quantity.value * pricePerItem;

  // Increment quantity
  void increment() {
    quantity.value++;
    updateColor();
  }

  // Decrement quantity
  void decrement() {
    if (quantity.value > 0) {
      quantity.value--;
      updateColor();
    }
  }

  // Update background color based on quantity
  void updateColor() {
    bgColor.value = quantity.value > 0
        ? const Color(0xFF00A86B)
        : const Color(0xFFe53935);
  }
}
