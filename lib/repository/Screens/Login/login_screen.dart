import 'package:rozana_grocery_app/Auth/phone_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/ui_helper.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customImage(img: "Blinkit Onboarding Screen.png"),
            SizedBox(height: 15.h),
            UiHelper.customImage(img: "image 10.png"),
            SizedBox(height: 15.h),
            UiHelper.customText(
              text: 'India’s last minute app',
              color: const Color(0xff000000),
              fontweight: FontWeight.bold,
              fontsize: 20.sp,
              fontfamily: "bold",
              textScaleFactor:1.0,
            ),
            // SizedBox(height: 10.h),
            Center(
              child: Card(
                elevation: 4.r,
                child: Container(
                  height: 200.h,
                  width: 350.w,
                  decoration: BoxDecoration(color: const Color(0xffFFFFFF),borderRadius: BorderRadius.circular(10.r)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        UiHelper.customText(
                          text: 'Sujal',
                          color: const Color(0xff000000),
                          fontweight: FontWeight.w400,
                          fontsize: 15.sp,
                          fontfamily: 'regular',
                          textScaleFactor:1.0,
                        ),
                        SizedBox(height: 20.h),
                        UiHelper.customText(
                          text: '78277XXXX',
                          color: const Color(0xff9C9C9C),
                          fontweight: FontWeight.w700,
                          fontsize: 14.sp,
                          fontfamily: 'bold',
                          textScaleFactor:1.0,
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 205.w,
                              height: 48.h,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const BottomNavbar(),
                                  //   ),
                                  // );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffE23744),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,

                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      UiHelper.customText(
                                        text: 'Login  with',
                                        color: const Color(0xffFFFFFF),
                                        fontweight: FontWeight.bold,
                                        fontsize: 14.sp,
                                        fontfamily: 'bold',
                                        textScaleFactor:1.0,
                                      ),
                                      SizedBox(width: 1.w),
                                      UiHelper.customImage(img: "img_zomotoLogo.png"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        UiHelper.customText(
                          text:
                              'Access your saved addresses from Zomato automatically!',
                          color: const Color(0xff9C9C9C),
                          fontweight: FontWeight.w400,
                          fontsize: 10.sp,
                          fontfamily: 'Regular',
                          textScaleFactor:1.0,
                        ),
                        SizedBox(height: 12.h),
                        InkWell(
                          onTap: () {
                            Get.to(const PhoneAuth());
                          },
                          child:UiHelper.customText(
                            text: 'or login with phone number',
                            color: const Color(0xff269237),
                            fontweight: FontWeight.w400,
                            fontsize: 14.sp,
                            fontfamily: 'Regular',
                            textScaleFactor:1.0,
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
