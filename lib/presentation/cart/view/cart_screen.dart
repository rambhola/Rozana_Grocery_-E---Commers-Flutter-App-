import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rozana_grocery_app/core/widgets/ui_helper.dart';
import 'package:rozana_grocery_app/presentation/cart/view_model/cart_controller.dart';
import 'package:rozana_grocery_app/presentation/navbar/view_model/nevbaar_change_color.dart';
import '../../category/view_model/quantity_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final CartController cart = Get.find<CartController>();
     Get.find<NavColourContainer>();


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "My Cart",
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () => Get.find<NavColourContainer>().backToHome(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              child: const Icon(
                Icons.arrow_back_outlined,
                color: Color(0xff3c8c52),
                size: 26,
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (cart.cartItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey.shade400),
                SizedBox(height: 16.h),
                Text("Your cart is empty", style: TextStyle(fontSize: 20.sp, color: Colors.grey.shade600)),
                SizedBox(height: 8.h),
                Text("Add items to get started!", style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade500)),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: cart.cartItems.length,
          itemBuilder: (context, index) {
            final item = cart.cartItems[index];

            final QuantityController qty = Get.find<QuantityController>();
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                cart.removeItemByName(item.name);
              },
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.red,
                child: const Icon(Icons.delete, color: Colors.white, size: 30),
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(10),
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1.4, color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: UiHelper.customImage(img: item.imageUrl),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "₹${item.price}",
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: qty.quantity.value > 0
                                      ? const Color(0xff3c8c52)
                                      : const Color(0xff2e6767),
                                ),
                                child: IconButton(
                                  onPressed: qty.quantity.value > 0 ? qty.decrement : null,
                                  icon: const Icon(Icons.remove, color: Colors.white, size: 20), // ✅ FIXED
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                qty.quantity.value.toString(),
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff3c8c52),
                                ),
                                child: IconButton(
                                  onPressed: qty.increment,
                                  icon: const Icon(Icons.add, color: Colors.white, size: 20),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "₹${(item.price * qty.quantity.value).toStringAsFixed(0)}", // ✅ Dynamic total
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Coupon Code",
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 50,
              width: 110,
              decoration: BoxDecoration(
                color: const Color(0xff3c8c52),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  "Apply",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
