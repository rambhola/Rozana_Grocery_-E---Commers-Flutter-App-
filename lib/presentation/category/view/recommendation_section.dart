import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/ui_helper.dart';
import '../../../data/models/view_model/product_model.dart';
import '../../cart/view/cart_screen.dart';
import '../../cart/view_model/cart_controller.dart';
import '../../cart/view_model/cart_item.dart';
import '../view_model/favorites_controller.dart';

class RecommendationSection extends StatelessWidget {
  final String image;

  const RecommendationSection({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final FavoritesController favController = Get.find<FavoritesController>();
    final CartController cartController = Get.find<CartController>();

    List<ProdcutModel> productList = [
      ProdcutModel(
        name: 'FORTUNE Sona Masoori\nSupreme Rice',
        image: 'Furtune_Rise-removebg-preview.png',
        price: 749,
        oldPrice: 1050,
      ),
      ProdcutModel(
        name: 'FORTUNE Sona Masoori\nSupreme Rice',
        image: 'Furtune_Rise-removebg-preview.png',
        price: 749,
        oldPrice: 1050,
      ),
      ProdcutModel(
        name: 'FORTUNE Sona Masoori\nSupreme Rice',
        image: 'Furtune_Rise-removebg-preview.png',
        price: 749,
        oldPrice: 1050,
      ),
      ProdcutModel(
        name: 'FORTUNE Sona Masoori\nSupreme Rice',
        image: 'Furtune_Rise-removebg-preview.png',
        price: 749,
        oldPrice: 1050,
      ),
      ProdcutModel(
        name: 'FORTUNE Sona Masoori\nSupreme Rice',
        image: 'Furtune_Rise-removebg-preview.png',
        price: 749,
        oldPrice: 1050,
      ),
      ProdcutModel(
        name: 'FORTUNE Sona Masoori\nSupreme Rice',
        image: 'Furtune_Rise-removebg-preview.png',
        price: 749,
        oldPrice: 1050,
      ),
      ProdcutModel(
        name: 'FORTUNE Sona Masoori\nSupreme Rice',
        image: 'Furtune_Rise-removebg-preview.png',
        price: 749,
        oldPrice: 1050,
      ),
      ProdcutModel(
        name: 'FORTUNE Sona Masoori\nSupreme Rice',
        image: 'Furtune_Rise-removebg-preview.png',
        price: 749,
        oldPrice: 1050,
      ),
    ];
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Product image
          Positioned.fill(
            child: IgnorePointer(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: UiHelper.customImage(img: image),
              ),
            ),
          ),

          // Favorite button (top‑right)
          Positioned(
            top: 10,
            right: 10,
            child: Obx(
                  () => Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: IconButton(
                  onPressed: favController.toggleFavorites,
                  icon: favController.isFavorite.value
                      ? const Icon(
                    Icons.favorite,
                    color: Color(0xff3c8c52),
                    size: 23,
                  )
                      : const Icon(
                    Icons.favorite_border,
                    color: Color(0xff3c8c52),
                    size: 23,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            left: 35,
            bottom: 10,
            child: Container(
              height: 35,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Add',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),

          // Plus button (bottom‑right)
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              height: 35,
              width: 35,
              decoration: const BoxDecoration(
                color: Color(0xff3c8c52),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 22,
                ),
                onPressed: () {

                  final product = productList[0];

                  cartController.addToCart(
                    CartItem(
                      imageUrl: product.image,
                      price: product.price,
                      name: product.name,
                      qty: 1,
                    ),);
                  // Navigate to cart screen
                  Get.to(() => CartScreen());
                },

              ),
            ),
          ),
        ],
      ),
    );
  }
}
