import 'package:get/get.dart';
import 'cart_item.dart';

class CartController extends GetxController {
  final cartItems = <CartItem>[].obs; // list of the all cart products

  void addToCart(CartItem item) {
    cartItems.add(
      CartItem(
        name: item.name,
        price: item.price,
        imageUrl: item.imageUrl,
        qty: 1,
      ),
    );
  }

  void increaseQty(int index) {
    cartItems[index].qty++;
    cartItems.refresh();
  }

  void decreaseQty(int index) {
    if (cartItems[index].qty > 1) {
      cartItems[index].qty--;
      cartItems.refresh();
    } else {
      cartItems.removeAt(index);
    }
  }
  void removeItemByName(String name) {
    cartItems.removeWhere((item) => item.name == name);
    cartItems.refresh();
  }



  double get total =>
      cartItems.fold(0.0, (sum, item) => sum + (item.price * item.qty));
}
