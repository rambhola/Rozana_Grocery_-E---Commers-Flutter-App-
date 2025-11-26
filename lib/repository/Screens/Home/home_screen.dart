import 'package:get/get.dart';
import 'package:rozana_grocery_app/CategoryCarousel/category_carousel.dart';
import 'package:rozana_grocery_app/repository/Screens/Address/pick_location.dart';
import 'package:rozana_grocery_app/repository/Screens/Profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/ui_helper.dart';
import '../Wallet/my_wallet.dart';

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
                final isLandScape = constraints.maxHeight > constraints.maxWidth;
                return Container(
                  width: double.infinity,
                  height: isLandScape ?260.h:100.h,
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
                        padding:  EdgeInsets.symmetric(vertical: isLandScape ? 25.h: 35 .h) ,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25,right: 5),
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
                              padding: EdgeInsets.only(right: 25,top: 25),
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
                              height: isLandScape? 55.h:45.h,
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
                              height: isLandScape? 55.h:45.h,
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
                              height: isLandScape?65.h:54.h,
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
                                    fontSize: isLandScape ? 30.h:14.sp,
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
                            height: isLandScape?65.h:54.h,
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

            //Getx slider widget Calling
            CategoryCarousel(),


          ],

          // SizedBox(width: 1.w, height: 5.h),
          // //To add a carousel slider,
          //
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           SizedBox(height: 15.h),
          //
          //           Row(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               // cart 1: Godlen Rose
          //               Stack(
          //                 children: [
          //                   // cart 1: Godlen Rose (Images of Products)
          //                   Padding(
          //                     padding: EdgeInsets.only(left: 15.w),
          //                     child: UiHelper.customImage(
          //                       img: 'Golden_glass.png',
          //                     ),
          //                   ),
          //                   // ADD - Button use for add items inside the cart sections
          //                   Padding(
          //                     padding: EdgeInsetsGeometry.only(
          //                       left: 75.w,
          //                       top: 95.h,
          //                     ),
          //                     child: UiHelper.customButton({}),
          //                   ),
          //                   // title of cart 1: Godlen Rose (2 Custom Field
          //                   Padding(
          //                     padding: EdgeInsets.only(
          //                       top: 120.h,
          //                       left: 15.w,
          //                     ),
          //                     child: UiHelper.customText(
          //                       text: 'Golden Glass',
          //                       color: Colors.black,
          //                       fontweight: FontWeight.w600,
          //                       fontsize: 12.sp,
          //                       fontfamily: 'Inter',
          //                       textScaleFactor: 1.0,
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding: EdgeInsets.only(
          //                       top: 133.h,
          //                       left: 15.w,
          //                     ),
          //                     child: UiHelper.customText(
          //                       text: 'Wooden Lid Candle (Oudh)',
          //                       color: Colors.black,
          //                       fontweight: FontWeight.w600,
          //                       fontsize: 12.sp,
          //                       fontfamily: 'Inter',
          //                       textScaleFactor: 1.0,
          //                     ),
          //                   ),
          //                   //Widgets For Delivery  time and Icons
          //                   Row(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Padding(
          //                         padding: EdgeInsets.only(
          //                           top: 155.h,
          //                           left: 15.w,
          //                         ),
          //                         child: UiHelper.customImage(
          //                           img: 'timer.png',
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.only(
          //                           top: 155.h,
          //                           left: 15.w,
          //                         ),
          //                         child: UiHelper.customText(
          //                           text: '16 MINS',
          //                           color: const Color(0xff9C9C9C),
          //                           fontweight: FontWeight.w400,
          //                           fontsize: 12.sp,
          //                           fontfamily: 'Poppins',
          //                           textScaleFactor: 1.0,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   // Widgets For Price And Rupees Icons
          //                   Row(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Padding(
          //                         padding: EdgeInsets.only(
          //                           top: 191.h,
          //                           left: 18.w,
          //                         ),
          //                         child: UiHelper.customImage(
          //                           img: 'Rupess.png',
          //                         ),
          //                       ),
          //
          //                       Padding(
          //                         padding: EdgeInsets.only(
          //                           top: 192.h,
          //                           left: 2.w,
          //                         ),
          //                         child: UiHelper.customText(
          //                           text: '79',
          //                           color: const Color(0xff000000),
          //                           fontweight: FontWeight.w700,
          //                           fontsize: 15.sp,
          //                           fontfamily: 'Poppins',
          //                           textScaleFactor: 1.0,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //               //cart 2 : Royal Gulab Jamun By Bikano
          //               Stack(
          //                 children: [
          //                   Padding(
          //                     padding: EdgeInsetsGeometry.only(left: 15.sp),
          //                     child: UiHelper.customImage(
          //                       img: 'Royal_GulabJamun.png',
          //                     ),
          //                   ),
          //                   // ADD - Button use for add items inside the cart sections
          //                   Padding(
          //                     padding: EdgeInsetsGeometry.only(
          //                       left: 75.w,
          //                       top: 95.h,
          //                     ),
          //                     child: UiHelper.customButton({}),
          //                   ),
          //                   // title of cart 2:Royal Gulab Jamun By Bikano (2 Custom Field
          //                   Padding(
          //                     padding: EdgeInsets.only(
          //                       top: 120.h,
          //                       left: 15.w,
          //                     ),
          //                     child: UiHelper.customText(
          //                       text: 'Royal Gulab Jamun',
          //                       color: Colors.black,
          //                       fontweight: FontWeight.w600,
          //                       fontsize: 12.sp,
          //                       fontfamily: 'Inter',
          //                       textScaleFactor: 1.0,
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding: EdgeInsets.only(
          //                       top: 133.h,
          //                       left: 15.w,
          //                     ),
          //                     child: UiHelper.customText(
          //                       text: 'By Bikano',
          //                       color: Colors.black,
          //                       fontweight: FontWeight.w600,
          //                       fontsize: 12.sp,
          //                       fontfamily: 'Inter',
          //                       textScaleFactor: 1.0,
          //                     ),
          //                   ),
          //                   //Widgets For Delivery  time and Icons
          //                   Row(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Padding(
          //                         padding: EdgeInsets.only(
          //                           top: 155.h,
          //                           left: 15.w,
          //                         ),
          //                         child: UiHelper.customImage(
          //                           img: 'timer.png',
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.only(
          //                           top: 155.h,
          //                           left: 15.w,
          //                         ),
          //                         child: UiHelper.customText(
          //                           text: '16 MINS',
          //                           color: const Color(0xff9C9C9C),
          //                           fontweight: FontWeight.w400,
          //                           fontsize: 12.sp,
          //                           fontfamily: 'Poppins',
          //                           textScaleFactor: 1.0,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   // Widgets For Price And Rupees Icons
          //                   Row(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Padding(
          //                         padding: EdgeInsets.only(
          //                           top: 191.h,
          //                           left: 18.w,
          //                         ),
          //                         child: UiHelper.customImage(
          //                           img: 'Rupess.png',
          //                         ),
          //                       ),
          //
          //                       Padding(
          //                         padding: EdgeInsets.only(
          //                           top: 192.h,
          //                           left: 2.w,
          //                         ),
          //                         child: UiHelper.customText(
          //                           text: '79',
          //                           color: const Color(0xff000000),
          //                           fontweight: FontWeight.w700,
          //                           fontsize: 15.sp,
          //                           fontfamily: 'Poppins',
          //                           textScaleFactor: 1.0,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //               // Cart 3: Bikaji Bhujia
          //               Stack(
          //                 children: [
          //                   // cart 3: Bikaji Bhujia (Images of Products)
          //                   Padding(
          //                     padding: EdgeInsetsGeometry.only(left: 15.w),
          //                     child: UiHelper.customImage(
          //                       img: 'Bikaji_Bhujiya.png',
          //                     ),
          //                   ),
          //                   // ADD - Button use for add items inside the cart sections
          //                   Padding(
          //                     padding: EdgeInsetsGeometry.only(
          //                       left: 75.w,
          //                       top: 95.h,
          //                     ),
          //                     child: UiHelper.customButton({}),
          //                   ),
          //                   // title of cart 3: Bikaji Bhujia(2 Custom Field
          //                   Padding(
          //                     padding: EdgeInsets.only(
          //                       top: 120.h,
          //                       left: 15.w,
          //                     ),
          //                     child: UiHelper.customText(
          //                       text: 'Bikaji Bhujia',
          //                       color: Colors.black,
          //                       fontweight: FontWeight.w600,
          //                       fontsize: 12.sp,
          //                       fontfamily: 'Inter',
          //                       textScaleFactor: 1.0,
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding: EdgeInsets.only(
          //                       top: 133.h,
          //                       left: 15.w,
          //                     ),
          //                     child: UiHelper.customText(
          //                       text: '',
          //                       color: Colors.black,
          //                       fontweight: FontWeight.w600,
          //                       fontsize: 12.sp,
          //                       fontfamily: 'Inter',
          //                       textScaleFactor: 1.0,
          //                     ),
          //                   ),
          //                   //Widgets For Delivery  time and Icons
          //                   Row(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Padding(
          //                         padding: EdgeInsets.only(
          //                           top: 155.h,
          //                           left: 15.w,
          //                         ),
          //                         child: UiHelper.customImage(
          //                           img: 'timer.png',
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.only(
          //                           top: 155.h,
          //                           left: 15.w,
          //                         ),
          //                         child: UiHelper.customText(
          //                           text: '16 MINS',
          //                           color: const Color(0xff9C9C9C),
          //                           fontweight: FontWeight.w400,
          //                           fontsize: 12.sp,
          //                           fontfamily: 'Poppins',
          //                           textScaleFactor: 1.0,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   // Widgets For Price And Rupees Icons
          //                   Row(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Padding(
          //                         padding: EdgeInsets.only(
          //                           top: 191.h,
          //                           left: 18.w,
          //                         ),
          //                         child: UiHelper.customImage(
          //                           img: 'Rupess.png',
          //                         ),
          //                       ),
          //
          //                       Padding(
          //                         padding: EdgeInsets.only(
          //                           top: 192.h,
          //                           left: 2.w,
          //                         ),
          //                         child: UiHelper.customText(
          //                           text: '79',
          //                           color: const Color(0xff000000),
          //                           fontweight: FontWeight.w700,
          //                           fontsize: 15.sp,
          //                           fontfamily: 'Poppins',
          //                           textScaleFactor: 1.0,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          //
          // Padding(
          //   padding: EdgeInsets.only(top: 10.h, left: 15.w, right: 220.w),
          //   child: UiHelper.customText(
          //     text: 'Grocery & Kitchen',
          //     color: const Color(0xff000000),
          //     fontweight: FontWeight.w700,
          //     fontsize: 14.sp,
          //     fontfamily: 'Poppins',
          //     textScaleFactor: 1.0,
          //   ),
          // ),
          //
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SizedBox(width: 15.w),
          //       // Cart 1: Vagetable And Fruites - Items 1
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           SizedBox(height: 10.h),
          //           Container(
          //             height: 81.h,
          //             width: 88.w,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: const Color(0xffD9EBEB),
          //             ),
          //             child: UiHelper.customImage(img: 'Vegitables.png'),
          //           ),
          //           UiHelper.customText(
          //             text: 'Vegetables &',
          //             color: const Color(0xff000000),
          //             fontweight: FontWeight.w400,
          //             fontsize: 12.sp,
          //             fontfamily: 'Poppins',
          //             textScaleFactor: 1.0,
          //           ),
          //           UiHelper.customText(
          //             text: 'Fruits',
          //             color: const Color(0xff000000),
          //             fontweight: FontWeight.w400,
          //             fontsize: 12.sp,
          //             fontfamily: 'Poppins',
          //             textScaleFactor: 1.0,
          //           ),
          //         ],
          //       ),
          //       // Cart 2: Atta, Dal ,  Rice  - Items 2
          //       SizedBox(width: 10.w),
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           SizedBox(height: 10.h),
          //           Container(
          //             height: 81.h,
          //             width: 88.w,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: const Color(0xffD9EBEB),
          //             ),
          //             child: UiHelper.customImage(img: 'Atta_Dal_Rise.png'),
          //           ),
          //           UiHelper.customText(
          //             text: 'Atta, Dal &',
          //             color: const Color(0xff000000),
          //             fontweight: FontWeight.w400,
          //             fontsize: 12.sp,
          //             textScaleFactor: 1.0,
          //             fontfamily: 'Poppins',
          //           ),
          //           UiHelper.customText(
          //             text: 'Rise',
          //             color: const Color(0xff000000),
          //             fontweight: FontWeight.w400,
          //             textScaleFactor: 1.0,
          //             fontsize: 12.sp,
          //             fontfamily: 'Poppins',
          //           ),
          //         ],
          //       ),
          //       SizedBox(width: 10.w),
          //       // Cart 3:  Oil, Ghee And  Masala - 3
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           SizedBox(height: 10.h),
          //           Container(
          //             height: 81.h,
          //             width: 88.w,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: const Color(0xffD9EBEB),
          //             ),
          //             child: UiHelper.customImage(img: 'Oil_Ghee_Masala.png'),
          //           ),
          //           UiHelper.customText(
          //             text: 'Oil Ghee &',
          //             color: const Color(0xff000000),
          //             fontweight: FontWeight.w400,
          //             fontsize: 12.sp,
          //             textScaleFactor: 1.0,
          //             fontfamily: 'Poppins',
          //           ),
          //           UiHelper.customText(
          //             text: 'Masala',
          //             color: const Color(0xff000000),
          //             fontweight: FontWeight.w400,
          //             fontsize: 12.sp,
          //             fontfamily: 'Poppins',
          //             textScaleFactor: 1.0,
          //           ),
          //         ],
          //       ),
          //       // Cart 4: Dairy, Bread & Milk - Items 4
          //       SizedBox(width: 10.w),
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           SizedBox(height: 10.h),
          //           Container(
          //             height: 81.h,
          //             width: 88.w,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: const Color(0xffD9EBEB),
          //             ),
          //             child: UiHelper.customImage(
          //               img: 'Dairy_Bread_Milk.png',
          //             ),
          //           ),
          //           UiHelper.customText(
          //             text: 'Dairy, Bread &',
          //             color: const Color(0xff000000),
          //             fontweight: FontWeight.w400,
          //             fontsize: 12.sp,
          //             fontfamily: 'Poppins',
          //             textScaleFactor: 1.0,
          //           ),
          //           UiHelper.customText(
          //             text: ' Milk',
          //             color: const Color(0xff000000),
          //             fontweight: FontWeight.w400,
          //             fontsize: 12.sp,
          //             fontfamily: 'Poppins',
          //             textScaleFactor: 1.0,
          //           ),
          //         ],
          //       ),
          //
          //       // Cart 4: Biscuits & Bakery  - Items 5
          //       SizedBox(width: 20.w),
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           SizedBox(height: 10.h),
          //           Container(
          //             height: 81.h,
          //             width: 88.w,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: const Color(0xffD9EBEB),
          //             ),
          //             child: UiHelper.customImage(img: 'Biscuites.png'),
          //           ),
          //           UiHelper.customText(
          //             text: 'Biscuits &',
          //             color: const Color(0xff000000),
          //             fontweight: FontWeight.w400,
          //             fontsize: 12.sp,
          //             fontfamily: 'Poppins',
          //             textScaleFactor: 1.0,
          //           ),
          //           UiHelper.customText(
          //             text: 'Bakery',
          //             color: const Color(0xff000000),
          //             fontweight: FontWeight.w400,
          //             fontsize: 12.sp,
          //             fontfamily: 'Poppins',
          //             textScaleFactor: 1.0,
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
