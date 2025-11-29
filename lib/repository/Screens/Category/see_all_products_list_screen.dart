import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rozana_grocery_app/Model/product_model.dart';
import '../Profile/profile_screen.dart';
import '../Wallet/my_wallet.dart';
import 'grocery_product_card.dart';

class SeeAllProductsListScreen extends StatefulWidget {
  final String address;
  final String newAddress;
  const SeeAllProductsListScreen({
    super.key,
    required this.address,
    required this.newAddress,
  });

  @override
  State<SeeAllProductsListScreen> createState() => _SeeAllProductsListScreenState();
}

class _SeeAllProductsListScreenState extends State<SeeAllProductsListScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isAddressExpanded = false;
  @override
  Widget build(BuildContext context) {
    final address = widget.address;
    var newAddress = widget.newAddress;

    //ProductList
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
          name:  'FORTUNE Sona Masoori\nSupreme Rice',
          image:
          'Furtune_Rise-removebg-preview.png',
          price: 749,
          oldPrice: 1050),
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
          name:  'FORTUNE Sona Masoori\nSupreme Rice',
          image:
          'Furtune_Rise-removebg-preview.png',
          price: 749,
          oldPrice: 1050),

    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                                  MyWallet(title: '', dateTime: '', amount: ''),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: GridView.builder(
                itemCount: productList.length,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,              // 2 items in a row
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context, index) {
                  final product = productList[index];

                  return GroceryProductCard(
                    image: product.image,
                    name: product.name,
                    price: product.price.toString(),
                    oldPrice: product.oldPrice.toString(),
                  );
                },
              ),
            ),
          )

        ],
      ),
    );
  }
}
