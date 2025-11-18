import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rozana_grocery_app/repository/Screens/Address/addresstype_controller.dart';
import 'package:rozana_grocery_app/repository/Screens/Address/manage_address.dart';
import 'package:rozana_grocery_app/repository/widgets/ui_helper.dart';

import '../Profile/profile_screen.dart';

class NewAddress extends StatefulWidget {
  const NewAddress({super.key});

  @override
  State<NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  final NewAddressController controller = Get.put(NewAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
            child: IconButton(
              onPressed: () => Get.to(() => const ProfileScreen()),
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF00A86B),
                size: 30,
              ),
            ),
          ),
        ),
        title: Text(
          "Creates Address",
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLandscape = constraints.maxWidth > constraints.maxHeight;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Address Type Label
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 18),
                  child: UiHelper.customText(
                    text: 'Address Type',
                    color: Colors.black,
                    fontweight: FontWeight.bold,
                    fontsize: isLandscape ? 6.sp : 19.sp,
                  ),
                ),

                /// HOME | WORK | OTHER
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isLandscape ? 10.w : 4.w,
                    vertical: 1.h,
                  ),
                  child: Row(
                    children: [
                      /// HOME
                      Card(
                        elevation: 3.5,
                        child: GestureDetector(
                          onTap: () {
                            controller.selectType(1);
                            controller.selectedTypeIndex.value = 1;
                          },
                          child: Obx(
                                () => Container(
                              height: isLandscape ? 75.h : 56.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: controller.selectedTypeIndex.value == 1
                                    ? Color(0xFF00A86B)
                                    : Colors.grey.shade300,
                              ),
                              child: Center(
                                child: UiHelper.customText(
                                  text: "HOME",
                                  color: controller.selectedTypeIndex.value == 1
                                      ? Colors.white
                                      : Colors.grey.shade700,
                                  fontweight: FontWeight.bold,
                                  fontsize: isLandscape ? 5.sp : 19.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// WORK
                      Card(
                        elevation: 3.5,
                        child: GestureDetector(
                          onTap: () {
                            controller.selectType(2);
                            controller.selectedTypeIndex.value = 2;
                          },
                          child: Obx(
                                () => Container(
                              height: isLandscape ? 75.h : 56.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: controller.selectedTypeIndex.value == 2
                                    ? Color(0xFF00A86B)
                                    : Colors.grey.shade300,
                              ),
                              child: Center(
                                child: UiHelper.customText(
                                  text: "Work",
                                  color: controller.selectedTypeIndex.value == 2
                                      ? Colors.white
                                      : Colors.grey.shade700,
                                  fontweight: FontWeight.bold,
                                  fontsize: isLandscape ? 5.sp : 19.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// OTHER
                      Card(
                        elevation: 3.5,
                        child: GestureDetector(
                          onTap: () {
                            controller.selectType(3);
                            controller.selectedTypeIndex.value = 3;
                          },
                          child: Obx(
                                () => Container(
                              height: isLandscape ? 75.h : 56.h,
                              width: 118.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: controller.selectedTypeIndex.value == 3
                                    ? Color(0xFF00A86B)
                                    : Colors.grey.shade300,
                              ),
                              child: Center(
                                child: UiHelper.customText(
                                  text: "Other",
                                  color: controller.selectedTypeIndex.value == 3
                                      ? Colors.white
                                      : Colors.grey.shade700,
                                  fontsize: isLandscape ? 5.sp : 19.sp,
                                  fontweight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
                  child: Card(
                    elevation: 5,
                    child: GestureDetector(
                      onTap: () {
                      },
                      child: Container(
                        height: isLandscape ?  1200.h: 760.h,
                        width: isLandscape ? 350.w : 390.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.grey.shade300,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 21.w,
                            vertical: 30.h,
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// STREET ADDRESS
                              UiHelper.customText(
                                text: 'Street Address ',
                                color: Colors.black,
                                fontweight: FontWeight.bold,
                                fontsize: isLandscape ?  9.sp: 18.sp,
                              ),
                              SizedBox(height: 5.h),

                              Container(
                                height: isLandscape ? 90.h:55.h,
                                width: isLandscape ? 330.w :340.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 1.5.r,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0.w),
                                  child: TextField(
                                    onChanged: (value) => controller.street.value = value,
                                    decoration: InputDecoration(
                                        hintText: 'Enter street address',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(fontSize: isLandscape ?10.sp : 19.sp)
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 5.h),

                              /// CITY & STATE Row
                              Row(
                                children: [
                                  /// CITY
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      UiHelper.customText(
                                        text: 'City',
                                        color: Colors.black,
                                        fontweight: FontWeight.bold,
                                        fontsize: isLandscape ?  9.sp: 18.sp,
                                      ),
                                      SizedBox(height: 10.h),
                                      Container(
                                        height: isLandscape ? 90.h: 55.h,
                                        width: 150.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11),
                                          color: Colors.white,
                                          border: Border.all(
                                            width: 1.5.r,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0.w),
                                          child:  TextField(
                                            onChanged: (value) => controller.city.value = value,
                                            decoration: InputDecoration(
                                                hintText: 'City',
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(fontSize: isLandscape ?10.sp : 19.sp)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(width: 10),

                                  /// STATE
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      UiHelper.customText(
                                        text: 'State',
                                        color: Colors.black,
                                        fontweight: FontWeight.bold,
                                        fontsize: isLandscape ?  9.sp: 18.sp,
                                      ),
                                      SizedBox(height: 10.h),
                                      Container(
                                        height:  isLandscape ? 90.h:55.h,
                                        width: 148.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11),
                                          color: Colors.white,
                                          border: Border.all(
                                            width: 1.5.r,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0.w),
                                          child: TextField(
                                            onChanged: (value) => controller.state.value = value,
                                            decoration:  InputDecoration(
                                                hintText: 'State',
                                                border: InputBorder.none,
                                                errorMaxLines: 2,
                                                hintStyle: TextStyle(fontSize: isLandscape ?10.sp : 19.sp)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(height: 5.h),

                              /// PIN + COUNTRY Row
                              Row(
                                children: [
                                  /// PINCODE
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      UiHelper.customText(
                                        text: 'Pincode',
                                        color: Colors.black,
                                        fontweight: FontWeight.bold,
                                        fontsize: isLandscape ?  9.sp: 18.sp,
                                      ),
                                      SizedBox(height: 10.h),
                                      Container(
                                        height: isLandscape ? 90.h: 55.h,
                                        width: 150.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11),
                                          color: Colors.white,
                                          border: Border.all(
                                            width: 1.5.r,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0.w),
                                          child:  TextField(
                                            onChanged: (value) => controller.pinCode.value = value,
                                            decoration: InputDecoration(
                                                hintText: 'PinCode',
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(fontSize: isLandscape ? 10.sp : 19.sp)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(width: 10),

                                  /// COUNTRY
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      UiHelper.customText(
                                        text: 'Country',
                                        color: Colors.black,
                                        fontweight: FontWeight.bold,
                                        fontsize: isLandscape ?  9.sp: 18.sp,
                                      ),
                                      SizedBox(height: 10.h),
                                      Container(
                                        height: isLandscape ? 90.h:55.h,
                                        width: 148.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11),
                                          color: Colors.white,
                                          border: Border.all(
                                            width: 1.5.r,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0.w),
                                          child: TextField(
                                            onChanged: (value) => controller.country.value = value,
                                            decoration: InputDecoration(
                                                hintText: 'Country',
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(fontSize: isLandscape ?10.sp : 19.sp)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(height: 5.h),

                              /// LANDMARK
                              UiHelper.customText(
                                text: 'Landmark',
                                color: Colors.black,
                                fontweight: FontWeight.bold,
                                fontsize: isLandscape ?  9.sp: 18.sp,
                              ),

                              Container(
                                height:isLandscape ? 90.h: 55.h,
                                width: 340.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 1.5.r,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0.w),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Near Hospitals',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(fontSize: isLandscape ?10.sp : 19.sp)
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 15.h),

                              /// LAT - LNG ROW
                              Container(
                                height: isLandscape ? 90.h:55.h,
                                width: 340.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: isLandscape ? 2.5: 1.5.r,
                                    color: Color(0xFF00A86B),
                                  ),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.all(8.0.r),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Lat: ${controller.currentLatLng.value?.latitude}',
                                      ),
                                      Text(
                                        'Lng: ${controller.currentLatLng.value?.longitude}',
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(height: 20.h),

                              SingleChildScrollView(
                                child: GestureDetector(
                                  onTap: () {
                                    /// bottom sheet
                                    Get.bottomSheet(
                                      Container(
                                        width: isLandscape ? 350.w: 370.w,
                                        height: isLandscape ? 200.h : 370.h,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF00A86B),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15.w,
                                            vertical: 15.h,
                                          ),
                                          child: Obx(() {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Update Locations",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                controller.loadingLocations.value
                                                    ? Text(
                                                  "Fetching GPS coordinates Updating...",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                )
                                                    : Text(
                                                  "Lat: ${controller.currentLatLng.value?.latitude}\n"
                                                      "Lng: ${controller.currentLatLng.value?.longitude}",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                        ),
                                      ),
                                    );

                                    /// location fetch runs in background
                                    controller.getCurrentLocation();
                                  },

                                  child: Container(
                                    height: isLandscape ? 220.h: 170.h,
                                    width: isLandscape ? 320.w : 340.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11),
                                      color: Colors.grey.shade400,
                                    ),
                                    child: Obx(
                                          () => Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 50,
                                            color: Color(0xFF00A86B),
                                          ),
                                          UiHelper.customText(
                                            text:
                                            '${controller.currentLatLng.value?.latitude}, ${controller.currentLatLng.value?.longitude}',
                                            color: Colors.grey.shade700,
                                            fontweight: FontWeight.normal,
                                            fontsize: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 20.h),

                              /// DEFAULT CHECKBOX
                              Row(
                                children: [
                                  Obx(
                                        () => Checkbox(
                                      value: controller.isDefault.value,
                                      onChanged: (value) {
                                        controller.toggleDefault(value);
                                      },
                                    ),
                                  ),
                                  UiHelper.customText(
                                    text: 'Set as default address',
                                    color: Colors.black,
                                    fontweight: FontWeight.bold,
                                    fontsize: isLandscape ?  8.sp: 14.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// CANCEL & SAVE BUTTONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Card(
                        elevation: 4.5,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(ManageAddress());
                          },
                          child: Container(
                            height: isLandscape ? 75.h : 56.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: Colors.grey.shade300,
                            ),
                            child: Center(
                              child: UiHelper.customText(
                                text: "Cancel",
                                color: Color(0xFF00A86B),
                                fontweight: FontWeight.bold,
                                fontsize: isLandscape ? 5.sp : 19.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Card(
                        elevation: 4.5,
                        child: GestureDetector(
                          onTap: () {
                            if (controller.validate()) {
                              Get.snackbar("Success", "All fields are valid!");
                            } else {
                              Get.bottomSheet(
                                Container(
                                  width:  isLandscape ?700.w:370.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        if (controller
                                            .streetError
                                            .value
                                            .isNotEmpty)
                                          Text(
                                            controller.streetError.value,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16,
                                            ),
                                          ),

                                        if (controller.cityError.value.isNotEmpty)
                                          Text(
                                            controller.cityError.value,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16,
                                            ),
                                          ),

                                        if (controller
                                            .stateError
                                            .value
                                            .isNotEmpty)
                                          Text(
                                            controller.stateError.value,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16,
                                            ),
                                          ),

                                        if (controller
                                            .pinCodeError
                                            .value
                                            .isNotEmpty)
                                          Text(
                                            controller.pinCodeError.value,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16,
                                            ),
                                          ),

                                        if (controller
                                            .countryError
                                            .value
                                            .isNotEmpty)
                                          Text(
                                            controller.countryError.value,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16,
                                            ),
                                          ),

                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: isLandscape ? 75.h : 56.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: controller.selectedTypeIndex.value == 1
                                  ? Color(0xFF00A86B)
                                  : Colors.grey,
                            ),
                            child: Center(
                              child: UiHelper.customText(
                                text: "Save",
                                color: Colors.grey.shade300,
                                fontweight: FontWeight.bold,
                                fontsize: isLandscape ? 5.sp : 19.sp,
                              ),
                            ),
                          ),
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
    );
  }
}
