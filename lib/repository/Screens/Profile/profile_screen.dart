import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rozana_grocery_app/repository/Screens/Profile/your_profile.dart';

import '../../../Auth/phone_auth.dart';
import '../Address/manage_address.dart';
import '../Coupons/my_coupons.dart';
import '../Home/home_screen.dart';
import '../Orders/my_orders.dart';
import '../Payment/payment_methods.dart';
import '../Wallet/my_wallet.dart';
import 'ImagePickerController.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePickerController controller = Get.put(ImagePickerController());
  void showLogoutDialog() {
    Get.defaultDialog(
      title: "Logout",
      titleStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.normal,
      ),

      middleText: "Are you sure you want to Logout",
      middleTextStyle: const TextStyle(
        fontSize: 16,
      ),
      radius: 15,
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          minimumSize: const Size(110, 45),
        ),
        onPressed: () {

          Get.to(const PhoneAuth());
        },
        child: const Text(
          "Yes, Logout",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      cancel: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          minimumSize: const Size(110, 45),
        ),
        onPressed: () {
          Get.back(); // Close dialog only
        },
        child: const Text(
          "Cancel",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () {
                  // Navigating to HomeScreen with required parameter
                  Get.to(() => const HomeScreen(address: 'address'));
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF00A86B),
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLandscape = constraints.maxWidth > constraints.maxHeight;
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: SingleChildScrollView(
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Picture + Edit Button
                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 80.r,
                            backgroundImage: controller.imagePath.value.isNotEmpty
                                ? FileImage(File(controller.imagePath.value))
                                : const AssetImage('assets/icon/man.png')
                            as ImageProvider,
                          ),
                          Positioned(
                            bottom: isLandscape ? 3.h : 6.h,
                            left: isLandscape ? 15.w : 20.w,
                            child: Container(
                              height: isLandscape ? 65.h : 50.h,
                              width: isLandscape ? 65.w : 50.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF00A86B),
                              ),
                              child: IconButton(
                                onPressed: controller.getImage,
                                icon: Icon(
                                  Icons.edit_square,
                                  color: Colors.white,
                                  size: isLandscape ? 20.sp : 34.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Guest User Text
                    Padding(
                      padding: EdgeInsets.only(
                        left: isLandscape ? 170.w : 150.w,
                        top: 10.h,
                      ),
                      child: const Text(
                        "Guest User",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    // Your Profile
                    GestureDetector(
                      onTap: () => Get.to(const YourProfile()),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline_sharp,
                                  color: const Color(0xFF00A86B),
                                  size: isLandscape ? 25.sp : 45.sp,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "Your Profile",
                                  style: TextStyle(fontSize: 19.sp),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () => Get.to(const YourProfile()),
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(color: Color(0xFF00A86B), thickness: 1, indent: 20, endIndent: 20),

                    // Manage Address
                    GestureDetector(
                      onTap: () => Get.to(const ManageAddress()),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: const Color(0xFF00A86B),
                                  size: isLandscape ? 25.sp : 45.sp,
                                ),
                                SizedBox(width: 10.w),
                                Text("Manage Address", style: TextStyle(fontSize: 19.sp)),
                              ],
                            ),
                            IconButton(
                              onPressed: () => Get.to(const ManageAddress()),
                              icon: Icon(Icons.arrow_forward_ios_rounded, size: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(color: Color(0xFF00A86B), thickness: 1, indent: 20, endIndent: 20),

                    // Payment Methods
                    GestureDetector(
                      onTap: () => Get.to(const PaymentMethods()),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.payment_outlined,
                                    color: const Color(0xFF00A86B),
                                    size: isLandscape ? 25.sp : 45.sp),
                                SizedBox(width: 10.w),
                                Text("Payment Methods", style: TextStyle(fontSize: 19.sp)),
                              ],
                            ),
                            IconButton(
                              onPressed: () => Get.to(const PaymentMethods()),
                              icon: Icon(Icons.arrow_forward_ios_rounded, size: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(color: Color(0xFF00A86B), thickness: 1.5, indent: 20, endIndent: 20),

                    // My Orders
                    GestureDetector(
                      onTap: () => Get.to(const MyOrders()),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.bookmark_border_rounded,
                                    color: const Color(0xFF00A86B),
                                    size: isLandscape ? 25.sp : 45.sp),
                                SizedBox(width: 10.w),
                                Text("My Orders", style: TextStyle(fontSize: 19.sp)),
                              ],
                            ),
                            IconButton(
                              onPressed: () => Get.to(const MyOrders()),
                              icon: Icon(Icons.arrow_forward_ios_rounded, size: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(color: Color(0xFF00A86B), thickness: 1.5, indent: 20, endIndent: 20),

                    // My Coupons
                    GestureDetector(
                      onTap: () => Get.to(const MyCoupons()),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.confirmation_number_outlined,
                                    color: const Color(0xFF00A86B),
                                    size: isLandscape ? 25.sp : 45.sp),
                                SizedBox(width: 10.w),
                                Text("My Coupons", style: TextStyle(fontSize: 19.sp)),
                              ],
                            ),
                            IconButton(
                              onPressed: () => Get.to(const MyCoupons()),
                              icon: Icon(Icons.arrow_forward_ios_rounded, size: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(color: Color(0xFF00A86B), thickness: 1, indent: 20, endIndent: 20),

                    // My Wallet
                    InkWell(
                      onTap: () => Get.to(
                        const MyWallet(title: '', dateTime: '', amount: ''),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.account_balance_wallet_outlined,
                                    color: const Color(0xFF00A86B),
                                    size: isLandscape ? 25.sp : 45.sp),
                                SizedBox(width: 10.w),
                                Text("My Wallet", style: TextStyle(fontSize: 19.sp)),
                              ],
                            ),
                            IconButton(
                              onPressed: () => Get.to(
                                const MyWallet(title: '', dateTime: '', amount: ''),
                              ),
                              icon: Icon(Icons.arrow_forward_ios_rounded, size: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(color: Color(0xFF00A86B), thickness: 1, indent: 20, endIndent: 20),

                    // Logout
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                      child: InkWell(
                        onTap: () {
                            showLogoutDialog();

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.logout,
                                    color: const Color(0xFF00A86B),
                                    size: isLandscape ? 25.sp : 45.sp),
                                SizedBox(width: 10.w),
                                Text("Logout", style: TextStyle(fontSize: 19.sp)),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios_rounded, size: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Color(0xFF00A86B),
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
