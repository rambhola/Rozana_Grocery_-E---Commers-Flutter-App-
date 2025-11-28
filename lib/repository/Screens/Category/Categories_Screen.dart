import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../CategoryCarousel/category_carousel.dart';
import '../../widgets/ui_helper.dart';
import '../Profile/profile_screen.dart';
import '../Wallet/my_wallet.dart';
import 'grocery_product_card.dart';

class CategoriesScreen extends StatefulWidget {
  final String address;
  final String newAddress;
  const CategoriesScreen({super.key, required this.address, required this.newAddress});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isAddressExpanded = false;
  @override
  Widget build(BuildContext context) {
    final address = widget.address;
    var newAddress = widget.newAddress;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final isLandScape =
                    constraints.maxHeight > constraints.maxWidth;
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: isLandScape ? 25.h : 35.h,
                        ),
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

                            // ------ ADDRESS + HOME ------
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  AnimatedContainer(
                                    duration: Duration(microseconds: 250),
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
                            // Aero Button
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

                            // -------- WALLET BUTTON --------
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              height: isLandScape ? 55.h : 45.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Get.to(
                                    MyWallet(
                                      title: '',
                                      dateTime: '',
                                      amount: '',
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.account_balance_wallet,
                                  color: Color(0xff3c8c52),
                                  size: 32,
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),

                            // -------- PROFILE BUTTON --------
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

                      // ================== SEARCH BAR ==================
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
                                decoration: InputDecoration(
                                  hintText: 'Search for products',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: isLandScape ? 30.h : 14.sp,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 8.w),
                          //......Notification Widget....
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

                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h, right: 10.w),
                    child: UiHelper.customText(
                      text: 'See All',
                      color: const Color(0xFF00A86B),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 15.w),
                  GroceryProductCard(
                    image: 'Furtune_Rise-removebg-preview.png',
                    name: 'FORTUNE Sona Masoori\nSupreme Rice',
                    price: '749',
                    oldPrice: '1050',
                  ),
                  const SizedBox(width: 12),
                  GroceryProductCard(
                    image: 'Furtune_Rise-removebg-preview.png',
                    name: 'FORTUNE Sona Masoori\nSupreme Rice',
                    price: '749',
                    oldPrice: '1050',
                  ),
                  SizedBox(width: 15.w),
                  GroceryProductCard(
                    image: 'Furtune_Rise-removebg-preview.png',
                    name: 'FORTUNE Sona Masoori\nSupreme Rice',
                    price: '749',
                    oldPrice: '1050',
                  ),
                  SizedBox(width: 15.w),
                  GroceryProductCard(
                    image: 'Furtune_Rise-removebg-preview.png',
                    name: 'FORTUNE Sona Masoori\nSupreme Rice',
                    price: '749',
                    oldPrice: '1050',
                  ),
                  GroceryProductCard(
                    image: 'Furtune_Rise-removebg-preview.png',
                    name: 'FORTUNE Sona Masoori\nSupreme Rice',
                    price: '749',
                    oldPrice: '1050',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
