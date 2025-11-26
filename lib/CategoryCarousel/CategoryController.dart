import 'package:get/get.dart';

class CategoryController extends GetxController {
  // Observable list of categories with icon paths
  var categories = <Map<String, String>>[
    {'icon': 'assets/icon/Grocery 1.jpg'},
    {'icon': 'assets/icon/Grocery 2.jpg'},
    {'icon': 'assets/icon/Weekend offer Mega sale List 1.png'},
    {'icon': 'assets/icon/Weekend offer Mega sale List 2.png'},
    {'icon': 'assets/icon/Weekend offer Mega sale List 3.png'},
    {'icon': 'assets/icon/Weekend offer Mega sale List 4.png'},
    {'icon': 'assets/icon/Weekend offer Mega sale List 5.png'},
  ].obs;

  // Observable for the selected carousel index
  var selectedIndex = 0.obs;

  // Method to update selected index when carousel page changes
  void updateIndex(int index) {
    selectedIndex.value = index;
  }

}
