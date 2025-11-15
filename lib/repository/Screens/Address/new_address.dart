import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:rozana_grocery_app/repository/Screens/Address/addresstype_controller.dart';
import 'package:rozana_grocery_app/repository/Screens/Address/manage_address.dart';
import 'package:rozana_grocery_app/repository/widgets/ui_helper.dart';

import '../Profile/profile_screen.dart';

class NewAddress extends StatefulWidget {

  final LatLng latLng;
  const NewAddress({super.key, required this.latLng});

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Address Type (Text)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 18),
                  child: UiHelper.customText(
                    text: 'Address Type',
                    color: Colors.black,
                    fontweight: FontWeight.bold,
                    fontsize: isLandscape ? 6.sp : 19.sp,
                  ),
                ),
                //Address  3 types (HOME | WORK | OTHER)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isLandscape ? 10.w : 4.w,
                    vertical: 1.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Home Tab
                      Card(
                        elevation: 3.5,
                        child: GestureDetector(
                          onTap: () {
                            controller.selectType(1);
                          },
                          child: Obx(
                            () => Container(
                              height: isLandscape ? 75.h : 56.h,
                              width: isLandscape ? 120.w : 120.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: controller.selectedTypeIndex.value == 1
                                    ? Color(0xFF00A86B)
                                    : Colors.grey.shade300,
                              ),
                              child: Align(
                                alignment: Alignment.center,
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
                      //Work Tab
                      Card(
                        elevation: 3.5,
                        child: GestureDetector(
                          onTap: () {
                            controller.selectType(2);
                          },
                          child: Obx(
                            () => Container(
                              height: isLandscape ? 75.h : 56.h,
                              width: isLandscape ? 120.w : 120.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: controller.selectedTypeIndex.value == 2
                                    ? Color(0xFF00A86B)
                                    : Colors.grey.shade300,
                              ),
                              child: Align(
                                alignment: Alignment.center,
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
                      //Other Tab
                      Card(
                        elevation: 3.5,
                        child: GestureDetector(
                          onTap: () {
                            controller.selectType(3);
                          },
                          child: Obx(
                            () => Container(
                              height: isLandscape ? 75.h : 56.h,
                              width: isLandscape ? 120.w : 120.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: controller.selectedTypeIndex.value == 3
                                    ? Color(0xFF00A86B)
                                    : Colors.grey.shade300,
                              ),
                              child: Align(
                                alignment: Alignment.center,
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
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: 780,
                      width: 390,
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
                            //Street Address
                            UiHelper.customText(
                              text: 'Street Address ',
                              color: Colors.black,
                              fontweight: FontWeight.bold,
                              fontsize: 18.sp,
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              height: 55.h,
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
                                child: Center(
                                  child: TextField(
                                    controller: null,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'Enter street address',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontSize: 17.sp,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // City & State TextField
                            SizedBox(height: 5.h),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //City TextField
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        UiHelper.customText(
                                          text: 'City',
                                          color: Colors.black,
                                          fontweight: FontWeight.bold,
                                          fontsize: 18.sp,
                                        ),
                                        SizedBox(height: 10.h),
                                        Container(
                                          height: 55.h,
                                          width: 150.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              11,
                                            ),
                                            color: Colors.white,
                                            border: Border.all(
                                              width: 1.5.r,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0.w),
                                            child: Center(
                                              child: TextField(
                                                controller: null,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  hintText: 'City',
                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                    fontSize: 17.sp,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    //State TextField
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        UiHelper.customText(
                                          text: 'State',
                                          color: Colors.black,
                                          fontweight: FontWeight.bold,
                                          fontsize: 18.sp,
                                        ),
                                        SizedBox(height: 10.h),
                                        Container(
                                          height: 55.h,
                                          width: 150.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              11,
                                            ),
                                            color: Colors.white,
                                            border: Border.all(
                                              width: 1.5.r,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0.w),
                                            child: Center(
                                              child: TextField(
                                                controller: null,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  hintText: 'State',
                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                    fontSize: 17.sp,
                                                    color: Colors.grey.shade700,
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
                              ],
                            ),
                            //PinCode & Country TextFeild
                            SizedBox(height: 5.h),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //PincodeTextField
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        UiHelper.customText(
                                          text: 'Pincode',
                                          color: Colors.black,
                                          fontweight: FontWeight.bold,
                                          fontsize: 18.sp,
                                        ),
                                        SizedBox(height: 10.h),
                                        Container(
                                          height: 55.h,
                                          width: 150.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              11,
                                            ),
                                            color: Colors.white,
                                            border: Border.all(
                                              width: 1.5.r,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0.w),
                                            child: Center(
                                              child: TextField(
                                                controller: null,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  hintText: 'PinCode',
                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                    fontSize: 17.sp,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    //Country TextField
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        UiHelper.customText(
                                          text: 'Country',
                                          color: Colors.black,
                                          fontweight: FontWeight.bold,
                                          fontsize: 18.sp,
                                        ),
                                        SizedBox(height: 10.h),
                                        Container(
                                          height: 55.h,
                                          width: 150.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              11,
                                            ),
                                            color: Colors.white,
                                            border: Border.all(
                                              width: 1.5.r,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0.w),
                                            child: Center(
                                              child: TextField(
                                                controller: null,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  hintText: 'Country',
                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                    fontSize: 17.sp,
                                                    color: Colors.grey.shade700,
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
                              ],
                            ),
                            SizedBox(height: 5.h),

                            //Landmark TextField
                            UiHelper.customText(
                              text: 'Landmark',
                              color: Colors.black,
                              fontweight: FontWeight.bold,
                              fontsize: 18.sp,
                            ),
                            Container(
                              height: 55.h,
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
                                child: Center(
                                  child: TextField(
                                    controller: null,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'Near Hospitals',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontSize: 17.sp,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // GPS coordinates of an address or a place, simply use our latitude and longitude finder
                            SizedBox(height: 15),
                            Container(
                              height: 55.h,
                              width: 340.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: Colors.white,
                                border: Border.all(
                                  width: 1.r,
                                  color: Color(0xFF00A86B),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Lat: ${controller.currentLatLng.value.latitude}'),
                                    Text('Lng: ${controller.currentLatLng.value.longitude}'),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: GestureDetector(
                                onTap: ()  async {
                                  await controller.fetchCurrentLocation();
                                },
                                child: Container(
                                  height: 200.h,
                                  width: 340.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: Colors.grey.shade400,
                                  ),
                                  child:
                                     Obx(() {
                                       return Column(
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           IconButton(
                                             onPressed: () {},
                                             icon: Icon(
                                               Icons.location_on_outlined,
                                               size: 50,
                                               color: Color(0xFF00A86B),
                                             ),
                                           ),
                                           UiHelper.customText(
                                             text: '${controller.currentLatLng.value.latitude}, ${controller.currentLatLng.value.longitude}',
                                             color: Colors.grey.shade700,
                                             fontweight: FontWeight.normal,
                                             fontsize: 16,
                                           ),
                                         ],
                                       );
                                     },)

                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Obx(() {
                                  return Checkbox(
                                    value: controller.isDefault.value,
                                    onChanged: controller.toggleDefault,
                                  );
                                }),
                                UiHelper.customText(
                                  text: 'Set as default address',
                                  color: Colors.black,
                                  fontweight: FontWeight.bold,
                                  fontsize: 14.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //Cancel and save Button
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            width: isLandscape ? 120.w : 120.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: Colors.grey.shade300,
                            ),
                            child: Align(
                              alignment: Alignment.center,
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
                          onTap: () {},
                          child: Container(
                            height: isLandscape ? 75.h : 56.h,
                            width: isLandscape ? 120.w : 120.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: controller.selectedTypeIndex.value == 1
                                  ? Color(0xFF00A86B)
                                  : Colors.grey,
                            ),
                            child: Align(
                              alignment: Alignment.center,
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
