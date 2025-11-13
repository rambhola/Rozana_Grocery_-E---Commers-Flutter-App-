import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/ui_helper.dart';

class PrintScreen extends StatefulWidget {
  const PrintScreen({super.key});

  @override
  State<PrintScreen> createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFACD),
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
          const SizedBox(height: 80),
          UiHelper.customText(
            text: 'Print Store',
            color: const Color(0xff000000),
            fontweight: FontWeight.w700,
            fontsize: 32.sp,
            fontfamily: 'Inter',
            textScaleFactor:1.0,
          ),
          UiHelper.customText(
            text: 'Blinkit ensures secure prints at every stage',
            color: const Color(0xff9C9C9C),
            fontweight: FontWeight.w700,
            fontsize: 14.sp,
            fontfamily: 'Inter',
            textScaleFactor:1.0,
          ),
          const SizedBox(height: 80),
          Container(
            width: 390.w,
            height: 163.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xffffffff),
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 11),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: UiHelper.customText(
                          text: 'Documents',
                          color: const Color(0xff000000),
                          fontweight: FontWeight.w700,
                          fontsize: 14.sp,
                          fontfamily: 'Inter',
                          textScaleFactor:1.0,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 14),
                          UiHelper.customText(
                            text: '✦  Price starting at rs 3/page',
                            color: const Color(0xff9C9C9C),
                            fontweight: FontWeight.normal,
                            fontsize: 14.sp,
                            fontfamily: 'Inter',
                            textScaleFactor:1.0,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 14),
                          UiHelper.customText(
                            text: '✦  Paper quality: 70 GSM',
                            color: const Color(0xff9C9C9C),
                            fontweight: FontWeight.normal,
                            fontsize: 14.sp,
                            fontfamily: 'Inter',
                            textScaleFactor:1.0,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 14),
                          UiHelper.customText(
                            text: '✦  Single side prints',
                            color: const Color(0xff9C9C9C),
                            fontweight: FontWeight.normal,
                            fontsize: 14.sp,
                            fontfamily: 'Inter',
                            textScaleFactor:1.0,
                          ),
                        ],
                      ),
                  
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextButton(
                          onPressed: () {},
                          child: UiHelper.customUploadFileButton({}),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 255, top: 35),
                  child: UiHelper.customImage(img: 'print_xerox.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
