import 'package:get/get.dart';
import 'package:rozana_grocery_app/CategoryCarousel/category_carousel.dart';
import 'package:rozana_grocery_app/repository/Screens/Category/grocery_product_card.dart';
import 'package:rozana_grocery_app/repository/Screens/Category/product_controller.dart';
import 'package:rozana_grocery_app/repository/Screens/Category/product_decription_page.dart';
import 'package:rozana_grocery_app/repository/Screens/Profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/ui_helper.dart';
import '../Category/see_all_products_list_screen.dart';
import '../Wallet/my_wallet.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  final String address;
  final String newAddress;

  const HomeScreen({
    super.key,
    required this.address,
    required this.newAddress,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final ProductController Controller = Get.put(ProductController());
  bool isAddressExpanded = false;

  @override
  Widget build(BuildContext context) {
    final address = widget.address;
    final newAddress = widget.newAddress;

    return Scaffold(
      body: Obx(() {
        bool isSearching = Controller.searchQuery.value.isNotEmpty;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------------- Header & Search ----------------
              LayoutBuilder(
                builder: (context, constraints) {
                  final isLandScape = constraints.maxHeight > constraints.maxWidth;

                  return Container(
                    width: double.infinity,
                    height: isLandScape ? 260.h : 100.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF00A86B),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: isLandScape ? 25.h : 35.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25, right: 5),
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Home",
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    ),
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 250),
                                      child: Text(
                                        newAddress.isNotEmpty
                                            ? newAddress
                                            : address.isNotEmpty
                                            ? address
                                            : "Select your delivery location",
                                        maxLines: isAddressExpanded ? 3 : 1,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 25, top: 25),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isAddressExpanded = !isAddressExpanded;
                                    });
                                  },
                                  child: Icon(
                                    isAddressExpanded
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: isLandScape ? 55.h : 45.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Get.to(MyWallet(title: '', dateTime: '', amount: ''));
                                  },
                                  icon: Icon(
                                    Icons.account_balance_wallet,
                                    color: Color(0xff3c8c52),
                                    size: 32,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: isLandScape ? 55.h : 45.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Get.to(ProfileScreen());
                                  },
                                  icon: Icon(
                                    Icons.person,
                                    color: Color(0xff3c8c52),
                                    size: 32,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: isLandScape ? 65.h : 54.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: TextField(
                                  controller: searchController,
                                  onChanged: (value) => Controller.searchProducts(value),
                                  decoration: InputDecoration(
                                    hintText: 'Search for products',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: isLandScape ? 30.h : 14.sp,
                                    ),
                                    prefixIcon: Icon(Icons.search, color: Colors.black),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              height: isLandScape ? 65.h : 54.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.notifications_outlined,
                                  color: Color(0xFF00A86B),
                                  size: 32,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),

              // ---------------- SEARCH RESULTS ----------------
              if (isSearching)
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Controller.filteredList.isEmpty
                      ? Center(
                    child: Text("No Products Found", style: TextStyle(fontSize: 16)),
                  )
                      : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Controller.filteredList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.70,
                    ),
                    itemBuilder: (context, index) {
                      final product = Controller.filteredList[index];
                      return Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                                "assets/Images/${product.image}",
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              product.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            SizedBox(height: 4),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  "₹${product.price}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  "₹${product.oldPrice}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                // Add to cart button

                                GestureDetector(
                                  onTap: () {

                                  },
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xFF00A86B),),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10,),
                                        Icon(CupertinoIcons.cart,color: Colors.white,size: 33,),
                                        SizedBox(width: 10,),
                                        Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 18),),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

              // ---------------- NORMAL HOME SCREEN ----------------
              if (!isSearching) ...[
                CategoryCarousel(),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, left: 15.w),
                      child: UiHelper.customText(
                        text: 'Grocery & Kitchen',
                        color: const Color(0xff000000),
                        fontweight: FontWeight.w700,
                        fontsize: 14,
                        fontfamily: 'Poppins',
                        textScaleFactor: 1.0,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SeeAllProductsListScreen(
                          address: widget.address,
                          newAddress: widget.newAddress,
                        ));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h, right: 10.w),
                        child: UiHelper.customText(
                          text: 'See All',
                          color: Color(0xFF00A86B),
                          fontweight: FontWeight.w700,
                          fontsize: 14,
                          fontfamily: 'Poppins',
                          textScaleFactor: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 15.w),
                      GestureDetector(
                        onTap: () => Get.to(ProductDecriptionPage()),
                        child: GroceryProductCard(
                          image: 'Furtune_Rise-removebg-preview.png',
                          name: 'FORTUNE Sona Masoori\nSupreme Rice',
                          price: '749',
                          oldPrice: '1050',
                        ),
                      ),
                      SizedBox(width: 12),
                      GestureDetector(
                        onTap: () => Get.to(ProductDecriptionPage()),
                        child: GroceryProductCard(
                          image: 'Furtune_Rise-removebg-preview.png',
                          name: 'FORTUNE Sona Masoori\nSupreme Rice',
                          price: '749',
                          oldPrice: '1050',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      }),
    );
  }
}
