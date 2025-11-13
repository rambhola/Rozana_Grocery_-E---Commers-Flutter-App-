import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/ui_helper.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 155.h,
                width: double.infinity.w,
                color: const Color(0xffF7CB45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        UiHelper.customText(
                          text: 'Blinkit in',
                          color: const Color(0xffffffff),
                          fontweight: FontWeight.bold,
                          fontsize: 14.sp,
                          fontfamily: 'Bold',
                          textScaleFactor:1.0,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        UiHelper.customText(
                          text: '16 minutes',
                          color: const Color(0xffffffff),
                          fontweight: FontWeight.bold,
                          fontsize: 20.sp,
                          fontfamily: 'Bold',
                          textScaleFactor:1.0,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        UiHelper.customText(
                          text: 'HOME - ',
                          color: const Color(0xffffffff),
                          fontweight: FontWeight.bold,
                          fontsize: 14.sp,
                          fontfamily: 'Bold',
                          textScaleFactor:1.0,
                        ),
                        const SizedBox(width: 5),
                        UiHelper.customText(
                          text: "Ram Vaishanav, Mandsuar (Mp)",
                          color: const Color(0xffffffff),
                          fontweight: FontWeight.bold,
                          fontsize: 14.sp,
                          textScaleFactor:1.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Positioned(
                right: 30,
                bottom: 80,
                child: CircleAvatar(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 7,
                child: UiHelper.customTextSearchField(
                  controller: searchController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 210),
            child: UiHelper.customText(
              text: 'Grocery & Kitchen',
              color: const Color(0xff000000),
              fontweight: FontWeight.w700,
              fontsize: 14.sp,
              fontfamily: 'Poppins',
              textScaleFactor:1.0,
            ),
          ),
          // Grocery & Items (Section 1)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 15),
                // Cart 1: Vegetable And Fruits - Items 1
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81,
                      width: 88,
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
                      textScaleFactor:1.0,
                    ),
                    UiHelper.customText(
                      text: 'Fruits',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                  ],
                ),
                // Cart 2: Atta, Dal ,  Rice  - Items 2
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81,
                      width: 88,
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
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                    UiHelper.customText(
                      text: 'Rise',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                // Cart 3:  Oil, Ghee And  Masala - 3
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81,
                      width: 88,
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
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                    UiHelper.customText(
                      text: 'Masala',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                  ],
                ),
                // Cart 4: Dairy, Bread & Milk - Items 4
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81,
                      width: 88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffD9EBEB),
                      ),
                      child: UiHelper.customImage(img: 'Dairy_Bread_Milk.png'),
                    ),
                    UiHelper.customText(
                      text: 'Dairy, Bread &',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                    UiHelper.customText(
                      text: ' Milk',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                  ],
                ),
                // Cart 5: Biscuits & Bakery  - Items 5
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81,
                      width: 88,
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
                      textScaleFactor:1.0,
                    ),
                    UiHelper.customText(
                      text: 'Bakery',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Grocery & Items (Section 2)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cart 1: Dry Fruits & Cereals - Items 1
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffD9EBEB),
                      ),
                      child: UiHelper.customImage(
                        img: 'Dry_Fruits_Cereals.png',
                      ),
                    ),
                    UiHelper.customText(
                      text: 'Dry Fruits &',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                    UiHelper.customText(
                      text: 'Cereals',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                  ],
                ),
                // Cart 2:Kitchen & Appliances  - Items 2
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffD9EBEB),
                      ),
                      child: UiHelper.customImage(
                        img: 'Kitchen_Applications.png',
                      ),
                    ),
                    UiHelper.customText(
                      text: 'Kitchen &',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                    UiHelper.customText(
                      text: 'Applications',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                // Cart 3: Tea & Coffees -  Items 3
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffD9EBEB),
                      ),
                      child: UiHelper.customImage(img: 'Tea_Coffees.png'),
                    ),
                    UiHelper.customText(
                      text: 'Tea &',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                    UiHelper.customText(
                      text: 'Coffees',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                  ],
                ),
                // Cart 4:Ice Creams & much more  - Items 4
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffD9EBEB),
                      ),
                      child: UiHelper.customImage(img: 'Ice_Creams.png'),
                    ),
                    UiHelper.customText(
                      text: 'Ice Creams &',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                    UiHelper.customText(
                      text: 'much more',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                  ],
                ),
                // Cart 5: Noodles & Packet Food - Items 5
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
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
                      textScaleFactor:1.0,
                    ),
                    UiHelper.customText(
                      text: 'Bakery',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 210),
            child: UiHelper.customText(
              text: 'Snacks & Drinks',
              color: const Color(0xff000000),
              fontweight: FontWeight.w700,
              fontsize: 14.sp,
              fontfamily: 'Poppins',
              textScaleFactor:1.0,
            ),
          ),
          // Snacks & Drinks (Section 1)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 15),
                // Cart 1: Chips & Namkeens- Items 1
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffD9EBEB),
                      ),
                      child: UiHelper.customImage(img: 'Chips_Namkeens.png'),
                    ),
                    UiHelper.customText(
                      text: 'Chips &',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      textScaleFactor:1.0,
                      fontfamily: 'Poppins',
                    ),
                    UiHelper.customText(
                      text: 'Namkeens',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      textScaleFactor:1.0,
                      fontfamily: 'Poppins',
                    ),
                  ],
                ),
                // Cart 2: Sweets & Chocalates  - Items 2
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffD9EBEB),
                      ),
                      child: UiHelper.customImage(img: 'Sweets_Chocalates.png'),
                    ),
                    UiHelper.customText(
                      text: 'Sweets &',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                    UiHelper.customText(
                      text: 'Chocalates',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                // Cart 3:  Drinks & Juices - 3
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0xffD9EBEB),
                      ),
                      child: UiHelper.customImage(img: 'Drinks_juices.png'),
                    ),
                    UiHelper.customText(
                      text: 'Drinks &',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                    UiHelper.customText(
                      text: 'juices',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                  ],
                ),
                // Cart 4:Sauces & Spreads- Items 4
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0xffD9EBEB),
                      ),
                      child: UiHelper.customImage(img: 'Sauces_Spreads.png'),
                    ),
                    UiHelper.customText(
                      text: 'Sauces &',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                    UiHelper.customText(
                      text: ' Spreads',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                  ],
                ),
                // Cart 5: Beauty & Cosmetics  - Items 5
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // SizedBox(height: 10),
                    Container(
                      height: 81.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0xffD9EBEB),
                      ),
                      child: UiHelper.customImage(img: 'Beauty_Cosmetics.png'),
                    ),
                    UiHelper.customText(
                      text: 'Beauty &',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontfamily: 'Poppins',
                      textScaleFactor:1.0,
                    ),
                    UiHelper.customText(
                      text: 'Cosmetics',
                      color: const Color(0xff000000),
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      textScaleFactor:1.0,
                      fontfamily: 'Poppins',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 210),
            child: UiHelper.customText(
              text: 'Household Essentials',
              color: const Color(0xff000000),
              fontweight: FontWeight.w700,
              fontsize: 14.sp,
              fontfamily: 'Poppins',
              textScaleFactor:1.0,
            ),
          ),
          // Household Essentials (Section 1)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cart 1: Surf Excel - Items 1
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0xffD9EBEB),
                      ),
                      child: UiHelper.customImage(img: 'surf_excel.png'),
                    ),
                  ],
                ),
                // Cart 2:skin strands Glycerin soap - Items 2
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0xffD9EBEB),
                      ),
                      child: UiHelper.customImage(
                        img: 'skin_strands_Glycerin_soap.png',
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                // Cart 3: Black  Eau De Perform -  Items 3
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0xffD9EBEB),
                      ),
                      child: UiHelper.customImage(
                        img: 'Black_Eau_De_Perform.png',
                      ),
                    ),
                  ],
                ),
                // Cart 4: Sofaa - Items 4
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0xffD9EBEB),
                      ),
                      child: UiHelper.customImage(img: 'Safaa_Images.png'),
                    ),
                  ],
                ),
                // Cart 5: Kesh King hair oil  - Items 5
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 81.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0xffD9EBEB),
                      ),
                      child: UiHelper.customImage(
                        img: 'Kesh_King_hair oil.png',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
