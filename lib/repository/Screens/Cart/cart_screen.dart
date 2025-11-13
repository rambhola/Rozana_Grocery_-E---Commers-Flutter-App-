import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/ui_helper.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController searchController = TextEditingController();
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
                          textScaleFactor: 1.0,
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
                          textScaleFactor: 1.0,
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
                          textScaleFactor: 1.0,
                        ),
                        const SizedBox(width: 5),
                        UiHelper.customText(
                          text: "Ram Vaishanav, Mandsuar (Mp)",
                          color: const Color(0xffffffff),
                          fontweight: FontWeight.bold,
                          fontsize: 14.sp,
                          textScaleFactor: 1.0,
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
          Image.asset('assets/Images/shopping_trolly.png'),
          const SizedBox(height: 20),
          UiHelper.customText(
            text: "Reordering will be easy",
            color: Colors.black,
            fontweight: FontWeight.bold,
            fontsize: 22.sp,
            fontfamily: 'bold',
            textScaleFactor: 1.0,
          ),

          const SizedBox(height: 10),
          const Padding(padding: EdgeInsets.only(left: 66)),
          UiHelper.customText(
            text: "Items you order will show up here so you can buy",
            color: Colors.black,
            fontweight: FontWeight.bold,
            fontsize: 12.sp,
            textScaleFactor: 1.0,
          ),
          UiHelper.customText(
            text: "them again easily",
            color: Colors.black,
            fontweight: FontWeight.bold,
            fontsize: 12.sp,
            textScaleFactor: 1.0,
          ),
          const SizedBox(height: 40),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              UiHelper.customText(
                text: "Bestsellers",
                color: Colors.black,
                fontweight: FontWeight.bold,
                fontsize: 16.sp,
                fontfamily: 'Bold',
                textScaleFactor: 1.0,
              ),
            ],
          ),

          const SizedBox(height: 18),
          Row(
            // Main Row to hold all three product cards horizontally
            children: [
              const SizedBox(width: 15),
              // Card 1  Amul Milk
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      UiHelper.customImage(img: "milk.png"),
                      // "ADD" Button positioned at the bottom right of the image
                      Padding(
                        padding: const EdgeInsets.only(left: 61, top: 95),
                        child: UiHelper.customButton({}),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  // Product Name
                  UiHelper.customText(
                    text: 'Amul Taaza Toned',
                    color: Colors.black,
                    fontweight: FontWeight.w400,
                    fontsize: 12.sp,
                    fontfamily: 'Regular',
                    textScaleFactor: 1.0,
                  ),
                  UiHelper.customText(
                    text: 'Fresh Milk',
                    color: Colors.black,
                    fontweight: FontWeight.w400,
                    fontsize: 12.sp,
                    fontfamily: 'Regular',
                    textScaleFactor: 1.0,
                  ),

                  const SizedBox(height: 5), // Spacing
                  // Delivery Time
                  Row(
                    children: [
                      UiHelper.customImage(img: 'timer.png'),
                      const SizedBox(width: 5),
                      UiHelper.customText(
                        text: '16 MINS',
                        color: const Color(0xff9C9C9C),
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontfamily: 'Regular',
                        textScaleFactor: 1.0,
                      ),
                    ],
                  ),

                  const SizedBox(height: 10), // Spacing
                  // Price
                  Row(
                    children: [
                      UiHelper.customImage(img: 'Rupess.png'),
                      const SizedBox(width: 2),
                      UiHelper.customText(
                        text: '27',
                        color: Colors.black,
                        fontweight: FontWeight.bold,
                        fontsize: 18.sp,
                        fontfamily: "Bold",
                        textScaleFactor: 1.0,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      UiHelper.customImage(img: "Pottatto.png"),
                      Padding(
                        padding: const EdgeInsets.only(left: 61, top: 95),
                        child: UiHelper.customButton({}),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  UiHelper.customText(
                    text: 'Potato (Aloo)',
                    color: Colors.black,
                    fontweight: FontWeight.w400,
                    fontsize: 12.sp,
                    fontfamily: 'Regular',
                    textScaleFactor: 1.0,
                  ),
                  UiHelper.customText(
                    text: '',
                    color: Colors.black,
                    fontweight: FontWeight.w400,
                    fontsize: 12.sp,
                    fontfamily: 'Regular',
                    textScaleFactor: 1.0,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      UiHelper.customImage(img: 'timer.png'),
                      const SizedBox(width: 5),
                      UiHelper.customText(
                        text: '16 MINS',
                        color: const Color(0xff9C9C9C),
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontfamily: 'Regular',
                        textScaleFactor: 1.0,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      UiHelper.customImage(img: 'Rupess.png'),
                      const SizedBox(width: 2),
                      UiHelper.customText(
                        text: '37',
                        textScaleFactor: 1.0,
                        color: Colors.black,
                        fontweight: FontWeight.bold,
                        fontsize: 18.sp,
                        fontfamily: "Bold",
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(width: 20),

              //Card 3: Hybrid Tomato
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      UiHelper.customImage(img: "Tommatto.png"),
                      Padding(
                        padding: const EdgeInsets.only(left: 61, top: 95),
                        child: UiHelper.customButton({}),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  UiHelper.customText(
                    text: 'Hybrid Tomato',
                    color: Colors.black,
                    fontweight: FontWeight.w400,
                    fontsize: 12.sp,
                    fontfamily: 'Regular',
                    textScaleFactor: 1.0,
                  ),
                  UiHelper.customText(
                    text: '',
                    color: Colors.black,
                    fontweight: FontWeight.w400,
                    fontsize: 12.sp,
                    fontfamily: 'Regular',
                    textScaleFactor: 1.0,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      UiHelper.customImage(img: 'timer.png'),
                      const SizedBox(width: 5),
                      UiHelper.customText(
                        text: '16 MINS',
                        color: const Color(0xff9C9C9C),
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontfamily: 'Regular',
                        textScaleFactor: 1.0,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      UiHelper.customImage(img: 'Rupess.png'),
                      const SizedBox(width: 2),
                      UiHelper.customText(
                        text: '37',
                        color: Colors.black,
                        fontweight: FontWeight.bold,
                        fontsize: 18.sp,
                        fontfamily: "Bold",
                        textScaleFactor: 1.0,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
