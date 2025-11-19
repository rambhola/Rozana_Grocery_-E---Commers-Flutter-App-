import 'dart:io';
import 'package:rozana_grocery_app/repository/Screens/Profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import 'ImagePickerController.dart';

class YourProfile extends StatefulWidget {
  const YourProfile({super.key});

  @override
  State<YourProfile> createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  ImagePickerController controller = Get.put(ImagePickerController());

  Future<void> saveProfile() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', nameController.text);
    prefs.setString('phone', phoneController.text);
    prefs.setString('email', emailController.text);
    prefs.setString('gender', genderController.text);



    if( nameController.text.trim().isEmpty ||
        phoneController.text.isEmpty  ||emailController.text.isEmpty
        || genderController.text.isEmpty ){
      Get.snackbar('Error', '',
        messageText:  Text("Please fill all required Field",style: TextStyle(fontSize:18,color: Colors.white ),),
        backgroundColor: Colors.red.shade400,
        colorText: Colors.white,
        snackPosition:  SnackPosition.BOTTOM,
      );
      return;
    }

    if (controller.imagePath.value.isNotEmpty) {
      await prefs.setString('image_path', controller.imagePath.value);
    }
    Get.snackbar(
      'Success',
      'Profile Updated Successfully',
      backgroundColor: Colors.purple.shade400,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );


  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('name') ?? '';
      phoneController.text = prefs.getString('phone') ?? '';
      emailController.text = prefs.getString('email') ?? '';
      genderController.text = prefs.getString('gender') ?? '';
      final imagePath = prefs.getString('image_path');
      if (imagePath != null && imagePath.isNotEmpty) {
        controller.imagePath.value = imagePath;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadProfile();
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
                  Get.to(() => const ProfileScreen());
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
          "Your Profile",
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isLandscape = constraints.maxWidth > constraints.maxHeight;

              return Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header row
                    SizedBox(height: 10.h),

                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 80.r,
                            backgroundImage:
                                controller.imagePath.value.isNotEmpty
                                ? FileImage(
                                    File(controller.imagePath.toString()),
                                  )
                                : const AssetImage('assets/icon/man.png'),
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

                    SizedBox(height: 20.h),

                    // Name
                    Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: isLandscape ? 70.h : 60.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0.w),
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: 'Guest User',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 15.h),

                    // Phone Number
                    Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: isLandscape ? 70.h : 60.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0.w),
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: 'Phone Number',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    // Email
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: isLandscape ? 70.h : 60.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0.w),
                        child: TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 15.h),

                    // Gender
                    Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 7.h),
                    Container(
                      height: isLandscape ? 70.h : 60.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0.w),
                        child: TextField(
                          controller: genderController,
                          decoration: const InputDecoration(
                            hintText: 'Gender',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),

                    // Update Button
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          saveProfile();
                        },
                        child: Container(
                          height: isLandscape ? 60.h : 65.h,
                          width: 350.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: const Color(0xFF00A86B),
                          ),
                          child: TextButton(
                            onPressed: saveProfile,
                            child: Text(
                              'Update',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isLandscape ? 12.sp : 20.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
