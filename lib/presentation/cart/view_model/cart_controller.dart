import 'package:get/get.dart';
import 'cart_item.dart';

class CartController extends GetxController {
  final cartItems = <CartItem>[].obs;

  void addToCart(CartItem item) {
    final index = cartItems.indexWhere((e) => e.name == item.name);

    if (index == -1) {
      cartItems.add(item);
    } else {
      cartItems[index].qty += item.qty;
      cartItems.refresh();
    }
  }

  void increaseQty(String name) {
    final index = cartItems.indexWhere((e) => e.name == name);

    if (index != -1) {
      cartItems[index].qty++;
      cartItems.refresh();
    }
  }

  void decreaseQty(String name) {
    final index = cartItems.indexWhere((e) => e.name == name);

    if (index != -1) {
      if (cartItems[index].qty > 1) {
        cartItems[index].qty--;
        cartItems.refresh();
      } else {
        cartItems.removeAt(index);
      }
    }
  }

  double get total =>
      cartItems.fold(0.0, (sum, item) => sum + (item.price * item.qty));
}
