import 'package:get/get.dart';
import '../../../data/models/view/product_data.dart';
import '../../../data/models/view_model/product_model.dart';


class ProductController extends GetxController {
  final ProductData productData = ProductData();

  var searchQuery = ''.obs;
  var filteredList = <ProdcutModel>[].obs;

  @override
  void onInit() {
    filteredList.clear();
    super.onInit();
  }

  void searchProducts(String query) {
    searchQuery.value = query;

    if (query.isEmpty) {
      filteredList.value = productData.productList;
    } else {
      filteredList.value = productData.productList
          .where((product) =>
          product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
  bool get isSearching => searchQuery.isNotEmpty;

}




