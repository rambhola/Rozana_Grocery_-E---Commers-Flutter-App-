import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/ui_helper.dart';
import '../view_model/favorites_controller.dart';

class RecommendationSection extends StatelessWidget {
  final String image;

  const RecommendationSection({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final FavoritesController favController = Get.put(FavoritesController());

    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          //product Image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: UiHelper.customImage(img: image),
            ),
          ),

          Positioned(
            top: 25,
            right: 1,
            child: Obx(() => Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              child: IconButton(
                onPressed: () =>{
                  Get.find<FavoritesController>().toggleFavorites()
                },
                icon: favController.isFavorite.value ?
                const Icon(
                  Icons.favorite_border_outlined,
                  color: Color(0xff3c8c52),
                  size: 23,
                ): const Icon(
                  Icons.favorite_outlined,
                  color: Color(0xff3c8c52),
                  size: 23,
                ),
              ),
            ),)
          ),

          
          Container(
            height: 35,
            width: 65,
            margin: EdgeInsets.only(top: 145,left:60),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5)
            ),child: Padding(
              padding: const EdgeInsets.only(top: 6,left: 3),
              child: Text('Add',style: TextStyle(fontSize: 17,),),
            ),
          ),
          Positioned(
            top: 146,
            right: 1,
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Color(0xff3c8c52),
                  shape: BoxShape.circle
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 22,
                ), onPressed: () {
                  Get.to('');
              },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
