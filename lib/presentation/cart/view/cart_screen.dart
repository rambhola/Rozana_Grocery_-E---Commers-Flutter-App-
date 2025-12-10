import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rozana_grocery_app/core/widgets/ui_helper.dart';
import 'package:rozana_grocery_app/presentation/cart/view_model/cart_controller.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    final CartController cart = Get.find<CartController>();

    return Scaffold(

      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: Color(0xff3c8c52),
                size: 26,
              ),
            ),
          ),
        ),


      ),
        body: Obx(() {
          return Column(
            children: [
              // Cart Items List
              
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: cart.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cart.cartItems[index];

                    return Container(
                      height: 110,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width:1,color: Colors.grey )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: UiHelper.customImage(
                              img: item.imageUrl,

                            ),
                          ),
                          const SizedBox(width: 10),

                          // Name + Price
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 4),
                                Text('₹${item.price}'),
                              ],
                            ),
                          ),

                          // Minus - Qty - Plus
                          Container(
                            height: 45,
                            width: 120,
                            margin: EdgeInsets.symmetric(vertical: 25,horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20)

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                GestureDetector(
                                  onTap: () => cart.decreaseQty(item.name),
                                  child: Container(
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade300,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.remove, size: 18,color: Colors.white,),
                                  ),
                                ),
                                const SizedBox(width: 8),

                                Text(
                                  '${item.qty}',
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 8),

                                GestureDetector(
                                  onTap: () => cart.increaseQty(item.name),
                                  child: Container(
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      color: Color(0xff3c8c52),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.add, size: 18,color: Colors.white,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Coupon + Apply
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Coupon Code',
                          hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 18),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 100,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xff3c8c52),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        "Apply",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        })


// helper for round +/- button


    );
  }
}
