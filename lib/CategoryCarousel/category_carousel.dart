import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'CategoryController.dart';

class CategoryCarousel extends StatelessWidget {
  final CategoryController catController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => CarouselSlider(
      items: catController.categories.map((cat) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                color: Colors.grey.shade300,
                child: Container(
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Image.asset(cat['icon']!,fit: BoxFit.contain,)),
              ),
            ),
          ],
        );
      }).toList(),
      options: CarouselOptions(
        height: 300,
        enlargeCenterPage: true,
        autoPlay: true,
        onPageChanged: (index, reason) {
          catController.updateIndex(index);
        },
      ),
    ));
  }
}
