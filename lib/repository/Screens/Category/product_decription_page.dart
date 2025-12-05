import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rozana_grocery_app/CategoryCarousel/quantity_controller.dart';
import 'package:rozana_grocery_app/CategoryCarousel/rating_controller.dart';
import 'package:rozana_grocery_app/repository/Screens/Category/item_sizecolour_container.dart';
import 'package:rozana_grocery_app/repository/Screens/Category/recommendation_section.dart';
import 'package:rozana_grocery_app/repository/widgets/ui_helper.dart';
import '../../../Model/product_model.dart';

class ProductDecriptionPage extends StatefulWidget {
  const ProductDecriptionPage({super.key});

  @override
  State<ProductDecriptionPage> createState() => _ProductDecriptionPageState();
}

class _ProductDecriptionPageState extends State<ProductDecriptionPage> {
  final RatingController ratingController = Get.put(RatingController());
  final QuantityController quantityController = Get.put(QuantityController());
  final itemSizeColourContainer = Get.put(ItemSizeColourContainer());

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(top: 5, right: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Color(0xff3c8c52),
                size: 23,
              ),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(top: 5, right: 15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.share, color: Color(0xff3c8c52), size: 23),
            ),
          ),
        ],
        backgroundColor: Colors.grey.shade300,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 90),   // <-- FIX ADDED HERE
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  child: SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: UiHelper.customImage(
                      img: 'Furtune_Rise-removebg-preview.png',
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'FORTUNE Sona Masoori\nSupreme Rice',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RatingBar.builder(
                              initialRating: ratingController.currentRating.value,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 25,
                              itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: Colors.amber),
                              onRatingUpdate: ratingController.updateRating,
                            ),
                            const SizedBox(width: 8),
                            Obx(
                                  () => Text(
                                "(${ratingController.currentRating.value})",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),

                      Obx(
                            () => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: quantityController.quantity.value > 0
                                    ? Color(0xff3c8c52)
                                    : Color(0xff2e6767),
                              ),
                              child: IconButton(
                                onPressed: quantityController.quantity.value > 0
                                    ? quantityController.decrement
                                    : null,
                                icon: Icon(
                                  Icons.remove,
                                  color: quantityController.bgColor.value,
                                  size: 20,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                '${quantityController.quantity.value}',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff3c8c52),
                              ),
                              child: IconButton(
                                onPressed: quantityController.increment,
                                icon: Icon(Icons.add, color: Colors.white, size: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 21),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    'Ingredients is not available of this products',
                    style: TextStyle(fontSize: 19, color: Colors.grey),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Description', style: TextStyle(fontSize: 21)),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    'Description',
                    style: TextStyle(fontSize: 19, color: Colors.grey),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Select Size', style: TextStyle(fontSize: 21)),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Obx(() => GestureDetector(
                          onTap: () => itemSizeColourContainer.selectContainer(0),
                          child: Container(
                            height: 50,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: itemSizeColourContainer.selectedIndex.value == 0
                                  ? Colors.amber
                                  : Color(0xFF00A86B),
                            ),
                            child: Center(
                              child: Text('10kg', style: TextStyle(color: Colors.white, fontSize: 18)),
                            ),
                          ),
                        )),
                        SizedBox(width: 10),

                        Obx(() => GestureDetector(
                          onTap: () => itemSizeColourContainer.selectContainer(1),
                          child: Container(
                            height: 50,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: itemSizeColourContainer.selectedIndex.value == 1
                                  ? Colors.amber
                                  : Color(0xFF00A86B),
                            ),
                            child: Center(
                              child: Text('20kg', style: TextStyle(color: Colors.white, fontSize: 18)),
                            ),
                          ),
                        )),
                        SizedBox(width: 10),

                        Obx(() => GestureDetector(
                          onTap: () => itemSizeColourContainer.selectContainer(2),
                          child: Container(
                            height: 50,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: itemSizeColourContainer.selectedIndex.value == 2
                                  ? Colors.amber
                                  : Color(0xFF00A86B),
                            ),
                            child: Center(
                              child: Text('30kg', style: TextStyle(color: Colors.white, fontSize: 18)),
                            ),
                          ),
                        )),
                        SizedBox(width: 10),

                        Obx(() => GestureDetector(
                          onTap: () => itemSizeColourContainer.selectContainer(3),
                          child: Container(
                            height: 50,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: itemSizeColourContainer.selectedIndex.value == 3
                                  ? Colors.amber
                                  : Color(0xFF00A86B),
                            ),
                            child: Center(
                              child: Text('40kg', style: TextStyle(color: Colors.white, fontSize: 18)),
                            ),
                          ),
                        )),
                        SizedBox(width: 10),

                        Obx(() => GestureDetector(
                          onTap: () => itemSizeColourContainer.selectContainer(4),
                          child: Container(
                            height: 50,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: itemSizeColourContainer.selectedIndex.value == 4
                                  ? Colors.amber
                                  : Color(0xFF00A86B),
                            ),
                            child: Center(
                              child: Text('50kg', style: TextStyle(color: Colors.white, fontSize: 18)),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),

                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text("Recommended For You", style: TextStyle(fontSize: 21)),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () => Get.to(ProductDecriptionPage()),
                        child: Text('see All', style: TextStyle(fontSize: 21, color: Color(0xFF00A86B))),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 215,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productList.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final product = productList[index];

                      return Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: SizedBox(
                          width: 140,
                          child: RecommendationSection(image: product.image),
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child:                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Price", style: TextStyle(color: Colors.grey,fontSize: 15)),
                    Obx(() =>Text(
                      "₹${quantityController.totalPrice.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ) ,),

                  ],
                ),
              ),
              // Add to cart button

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFF00A86B),),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10,),
                          Icon(CupertinoIcons.cart,color: Colors.white,size: 33,),
                          SizedBox(width: 10,),
                          Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 23),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
