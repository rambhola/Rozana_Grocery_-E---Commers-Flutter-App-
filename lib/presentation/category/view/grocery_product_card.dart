import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rozana_grocery_app/presentation/cart/view_model/cart_controller.dart';

import '../../../core/widgets/ui_helper.dart';
import '../../../data/models/view_model/product_model.dart';
import '../../cart/view/cart_screen.dart';
import '../../cart/view_model/cart_item.dart';
class GroceryProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String oldPrice;

  const GroceryProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {

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
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: UiHelper.customImage(img: image),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              color: Colors.grey.shade300,
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '₹$price',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xff00A86B),
                          ),
                        ),
                        Text(
                          '₹$oldPrice',
                          style: TextStyle(
                            fontSize: 11,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(

                      onTap: () {
                        final product = productList[0];

                        cartController.addToCart(
                          CartItem(

                              imageUrl: product.image,
                              name: product.name,
                              price: product.price,
                              qty: 1,
                          ),);
                        // Navigate to cart screen
                        Get.to(() => CartScreen());
                      },
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: const BoxDecoration(
                          color: Color(0xff00A86B),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
