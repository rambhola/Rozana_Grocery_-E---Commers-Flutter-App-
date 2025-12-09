import 'package:get/get.dart';

class RatingController extends GetxController{
  var currentRating = 5.0.obs;

  void updateRating(double rating){
    currentRating.value = rating;
  }
}