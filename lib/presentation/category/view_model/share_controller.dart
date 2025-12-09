import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:rozana_grocery_app/data/models/view/product_data.dart';

class ShareController extends GetxController {
  void shareProduct(String productName, double productPrice) {
    Share.share(
        '🍚 $productName\n💰 Just ₹$productPrice\nGreat deal! 🔥',
        subject: 'Rozana Grocery - Best Deals!'
    );
  }
}
