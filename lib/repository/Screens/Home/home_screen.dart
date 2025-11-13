import 'package:rozana_grocery_app/repository/Screens/Profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/ui_helper.dart';

class HomeScreen extends StatefulWidget {
  final String address ;
  const HomeScreen({super.key, required this.address,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final address = widget.address;


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            LayoutBuilder(
            builder: (context, constraints) {
              final isLandscape = constraints.maxWidth > constraints.maxHeight;
              return Container(
                width: double.infinity,
                color: const Color(0xffEC0505),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Row
                    Padding(
                      padding:  EdgeInsets.all(8.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                const SizedBox(height: 10,),
                              Text("Blinkit in",
                                  style: TextStyle(color: Colors.white, fontSize: 22.sp,fontWeight: FontWeight.bold)),
                              Text("16 minutes",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 300.w,
                                child: Text(
                                  address.isNotEmpty
                                      ? address
                                      : "Select your delivery location",
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 12.sp,fontWeight: FontWeight.w500),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ProfileScreen()),
                                );
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.person, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Container(
                      height: 42.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search “ice-cream”',
                          hintStyle:
                          TextStyle(color: Colors.grey[600], fontSize: 14.sp),
                          prefixIcon:
                          const Icon(Icons.search, color: Colors.black),
                          suffixIcon:
                          const Icon(Icons.mic_none, color: Colors.black),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

            SizedBox(width: 1.w, height: 5.h),
            Stack(
              children: [
                Container(
                  height: 200.h,
                  width: double.infinity,
                  color: const Color(0xffEC0505),
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // const SizedBox(width: 12),
                      UiHelper.customImage(img: "FireCracras1.png"),
                      UiHelper.customImage(img: "FireCracras2.png"),

                      Expanded(
                        child: UiHelper.customText(
                          text: 'Mega Diwali Sale',
                          color: Colors.white,
                          fontweight: FontWeight.w700,
                          fontsize: 17.sp,
                          fontfamily: 'PT Serif',
                          textScaleFactor: 1.0,
                        ),
                      ),

                      // const SizedBox(width: 16),
                      UiHelper.customImage(img: "FireCracras2.png"),
                      UiHelper.customImage(img: "FireCracras1.png"),
                    ],
                  ),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 55.h, left: 10.w),
                        child: Container(
                          height: 125.h,
                          width: 85.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffEAD3D3),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.h),
                                UiHelper.customText(
                                  text: 'Lights,Diyas ',
                                  color: Colors.black,
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontfamily: 'Poppins',
                                  textScaleFactor: 1.0,
                                ),
                                UiHelper.customText(
                                  text: '& Candles',
                                  color: Colors.black,
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontfamily: 'Poppins',
                                  textScaleFactor: 1.0,
                                ),
                                UiHelper.customImage(img: 'Lamps.png'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Cart 2: Diwali Gifts
                      Padding(
                        padding: EdgeInsets.only(top: 55.h, left: 20.w),
                        child: Container(
                          height: 125.h,
                          width: 85.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffEAD3D3),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 7.h),
                                UiHelper.customText(
                                  text: 'Diwali ',
                                  color: Colors.black,
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontfamily: 'Poppins',
                                  textScaleFactor: 1.0,
                                ),
                                UiHelper.customText(
                                  text: 'Gifts',
                                  color: Colors.black,
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontfamily: 'Poppins',
                                  textScaleFactor: 1.0,
                                ),
                                SizedBox(height: 8.h),
                                UiHelper.customImage(img: 'diwali_gifts.png'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Cart 3: Electronics Products
                      Padding(
                        padding: EdgeInsets.only(top: 55.h, left: 20.w),
                        child: Container(
                          height: 125.h,
                          width: 85.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffEAD3D3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 8.h),
                                UiHelper.customText(
                                  text: 'Appliances',
                                  color: Colors.black,
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontfamily: 'Poppins',
                                  textScaleFactor: 1.0,
                                ),
                                UiHelper.customText(
                                  text: '& Gadgets',
                                  color: Colors.black,
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontfamily: 'Poppins',
                                  textScaleFactor: 1.0,
                                ),
                                SizedBox(height: 18.h),
                                UiHelper.customImage(img: 'electronics.png'),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //Cart : 4 Home & Living Items
                      Padding(
                        padding: EdgeInsets.only(top: 55.h, left: 20.w),
                        child: Container(
                          height: 125.h,
                          width: 85.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffEAD3D3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                SizedBox(height: 8.h),
                                UiHelper.customText(
                                  text: 'Home',
                                  color: Colors.black,
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontfamily: 'Poppins',
                                  textScaleFactor: 1.0,
                                ),
                                UiHelper.customText(
                                  text: '& Living',
                                  color: Colors.black,
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontfamily: 'Poppins',
                                  textScaleFactor: 1.0,
                                ),

                                UiHelper.customImage(img: 'home_sofas.png'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // cart 1: Godlen Rose
                          Stack(
                            children: [
                              // cart 1: Godlen Rose (Images of Products)
                              Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: UiHelper.customImage(
                                  img: 'Golden_glass.png',
                                ),
                              ),
                              // ADD - Button use for add items inside the cart sections
                              Padding(
                                padding: EdgeInsetsGeometry.only(
                                  left: 75.w,
                                  top: 95.h,
                                ),
                                child: UiHelper.customButton({}),
                              ),
                              // title of cart 1: Godlen Rose (2 Custom Field
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 120.h,
                                  left: 15.w,
                                ),
                                child: UiHelper.customText(
                                  text: 'Golden Glass',
                                  color: Colors.black,
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontfamily: 'Inter',
                                  textScaleFactor: 1.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 133.h,
                                  left: 15.w,
                                ),
                                child: UiHelper.customText(
                                  text: 'Wooden Lid Candle (Oudh)',
                                  color: Colors.black,
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontfamily: 'Inter',
                                  textScaleFactor: 1.0,
                                ),
                              ),
                              //Widgets For Delivery  time and Icons
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 155.h,
                                      left: 15.w,
                                    ),
                                    child: UiHelper.customImage(
                                      img: 'timer.png',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 155.h,
                                      left: 15.w,
                                    ),
                                    child: UiHelper.customText(
                                      text: '16 MINS',
                                      color: const Color(0xff9C9C9C),
                                      fontweight: FontWeight.w400,
                                      fontsize: 12.sp,
                                      fontfamily: 'Poppins',
                                      textScaleFactor: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              // Widgets For Price And Rupees Icons
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 191.h,
                                      left: 18.w,
                                    ),
                                    child: UiHelper.customImage(
                                      img: 'Rupess.png',
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 192.h,
                                      left: 2.w,
                                    ),
                                    child: UiHelper.customText(
                                      text: '79',
                                      color: const Color(0xff000000),
                                      fontweight: FontWeight.w700,
                                      fontsize: 15.sp,
                                      fontfamily: 'Poppins',
                                      textScaleFactor: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          //cart 2 : Royal Gulab Jamun By Bikano
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsGeometry.only(left: 15.sp),
                                child: UiHelper.customImage(
                                  img: 'Royal_GulabJamun.png',
                                ),
                              ),
                              // ADD - Button use for add items inside the cart sections
                              Padding(
                                padding: EdgeInsetsGeometry.only(
                                  left: 75.w,
                                  top: 95.h,
                                ),
                                child: UiHelper.customButton({}),
                              ),
                              // title of cart 2:Royal Gulab Jamun By Bikano (2 Custom Field
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 120.h,
                                  left: 15.w,
                                ),
                                child: UiHelper.customText(
                                  text: 'Royal Gulab Jamun',
                                  color: Colors.black,
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontfamily: 'Inter',
                                  textScaleFactor: 1.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 133.h,
                                  left: 15.w,
                                ),
                                child: UiHelper.customText(
                                  text: 'By Bikano',
                                  color: Colors.black,
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontfamily: 'Inter',
                                  textScaleFactor: 1.0,
                                ),
                              ),
                              //Widgets For Delivery  time and Icons
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 155.h,
                                      left: 15.w,
                                    ),
                                    child: UiHelper.customImage(
                                      img: 'timer.png',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 155.h,
                                      left: 15.w,
                                    ),
                                    child: UiHelper.customText(
                                      text: '16 MINS',
                                      color: const Color(0xff9C9C9C),
                                      fontweight: FontWeight.w400,
                                      fontsize: 12.sp,
                                      fontfamily: 'Poppins',
                                      textScaleFactor: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              // Widgets For Price And Rupees Icons
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 191.h,
                                      left: 18.w,
                                    ),
                                    child: UiHelper.customImage(
                                      img: 'Rupess.png',
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 192.h,
                                      left: 2.w,
                                    ),
                                    child: UiHelper.customText(
                                      text: '79',
                                      color: const Color(0xff000000),
                                      fontweight: FontWeight.w700,
                                      fontsize: 15.sp,
                                      fontfamily: 'Poppins',
                                      textScaleFactor: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Cart 3: Bikaji Bhujia
                          Stack(
                            children: [
                              // cart 3: Bikaji Bhujia (Images of Products)
                              Padding(
                                padding: EdgeInsetsGeometry.only(left: 15.w),
                                child: UiHelper.customImage(
                                  img: 'Bikaji_Bhujiya.png',
                                ),
                              ),
                              // ADD - Button use for add items inside the cart sections
                              Padding(
                                padding: EdgeInsetsGeometry.only(
                                  left: 75.w,
                                  top: 95.h,
                                ),
                                child: UiHelper.customButton({}),
                              ),
                              // title of cart 3: Bikaji Bhujia(2 Custom Field
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 120.h,
                                  left: 15.w,
                                ),
                                child: UiHelper.customText(
                                  text: 'Bikaji Bhujia',
                                  color: Colors.black,
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontfamily: 'Inter',
                                  textScaleFactor: 1.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 133.h,
                                  left: 15.w,
                                ),
                                child: UiHelper.customText(
                                  text: '',
                                  color: Colors.black,
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontfamily: 'Inter',
                                  textScaleFactor: 1.0,
                                ),
                              ),
                              //Widgets For Delivery  time and Icons
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 155.h,
                                      left: 15.w,
                                    ),
                                    child: UiHelper.customImage(
                                      img: 'timer.png',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 155.h,
                                      left: 15.w,
                                    ),
                                    child: UiHelper.customText(
                                      text: '16 MINS',
                                      color: const Color(0xff9C9C9C),
                                      fontweight: FontWeight.w400,
                                      fontsize: 12.sp,
                                      fontfamily: 'Poppins',
                                      textScaleFactor: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              // Widgets For Price And Rupees Icons
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 191.h,
                                      left: 18.w,
                                    ),
                                    child: UiHelper.customImage(
                                      img: 'Rupess.png',
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 192.h,
                                      left: 2.w,
                                    ),
                                    child: UiHelper.customText(
                                      text: '79',
                                      color: const Color(0xff000000),
                                      fontweight: FontWeight.w700,
                                      fontsize: 15.sp,
                                      fontfamily: 'Poppins',
                                      textScaleFactor: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 15.w, right: 220.w),
              child: UiHelper.customText(
                text: 'Grocery & Kitchen',
                color: const Color(0xff000000),
                fontweight: FontWeight.w700,
                fontsize: 14.sp,
                fontfamily: 'Poppins',
                textScaleFactor: 1.0,
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 15.w),
                  // Cart 1: Vagetable And Fruites - Items 1
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Container(
                        height: 81.h,
                        width: 88.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffD9EBEB),
                        ),
                        child: UiHelper.customImage(img: 'Vegitables.png'),
                      ),
                      UiHelper.customText(
                        text: 'Vegetables &',
                        color: const Color(0xff000000),
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontfamily: 'Poppins',
                        textScaleFactor: 1.0,
                      ),
                      UiHelper.customText(
                        text: 'Fruits',
                        color: const Color(0xff000000),
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontfamily: 'Poppins',
                        textScaleFactor: 1.0,
                      ),
                    ],
                  ),
                  // Cart 2: Atta, Dal ,  Rice  - Items 2
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Container(
                        height: 81.h,
                        width: 88.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffD9EBEB),
                        ),
                        child: UiHelper.customImage(img: 'Atta_Dal_Rise.png'),
                      ),
                      UiHelper.customText(
                        text: 'Atta, Dal &',
                        color: const Color(0xff000000),
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        textScaleFactor: 1.0,
                        fontfamily: 'Poppins',
                      ),
                      UiHelper.customText(
                        text: 'Rise',
                        color: const Color(0xff000000),
                        fontweight: FontWeight.w400,
                        textScaleFactor: 1.0,
                        fontsize: 12.sp,
                        fontfamily: 'Poppins',
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w),
                  // Cart 3:  Oil, Ghee And  Masala - 3
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Container(
                        height: 81.h,
                        width: 88.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffD9EBEB),
                        ),
                        child: UiHelper.customImage(img: 'Oil_Ghee_Masala.png'),
                      ),
                      UiHelper.customText(
                        text: 'Oil Ghee &',
                        color: const Color(0xff000000),
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        textScaleFactor: 1.0,
                        fontfamily: 'Poppins',
                      ),
                      UiHelper.customText(
                        text: 'Masala',
                        color: const Color(0xff000000),
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontfamily: 'Poppins',
                        textScaleFactor: 1.0,
                      ),
                    ],
                  ),
                  // Cart 4: Dairy, Bread & Milk - Items 4
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Container(
                        height: 81.h,
                        width: 88.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffD9EBEB),
                        ),
                        child: UiHelper.customImage(
                          img: 'Dairy_Bread_Milk.png',
                        ),
                      ),
                      UiHelper.customText(
                        text: 'Dairy, Bread &',
                        color: const Color(0xff000000),
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontfamily: 'Poppins',
                        textScaleFactor: 1.0,
                      ),
                      UiHelper.customText(
                        text: ' Milk',
                        color: const Color(0xff000000),
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontfamily: 'Poppins',
                        textScaleFactor: 1.0,
                      ),
                    ],
                  ),

                  // Cart 4: Biscuits & Bakery  - Items 5
                  SizedBox(width: 20.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Container(
                        height: 81.h,
                        width: 88.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffD9EBEB),
                        ),
                        child: UiHelper.customImage(img: 'Biscuites.png'),
                      ),
                      UiHelper.customText(
                        text: 'Biscuits &',
                        color: const Color(0xff000000),
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontfamily: 'Poppins',
                        textScaleFactor: 1.0,
                      ),
                      UiHelper.customText(
                        text: 'Bakery',
                        color: const Color(0xff000000),
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontfamily: 'Poppins',
                        textScaleFactor: 1.0,
                      ),
                    ],
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
