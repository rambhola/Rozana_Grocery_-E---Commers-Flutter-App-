import 'package:rozana_grocery_app/repository/Screens/Profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/ui_helper.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  String selectPaymentMethods = "";

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
          "Payment Methods",
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLandscape = constraints.maxHeight > constraints.maxWidth;

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Payment Methods - (Cash)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  child: UiHelper.customText(
                    text: "Cash",
                    color: Colors.black,
                    fontweight: FontWeight.bold,
                    fontsize: 21,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectPaymentMethods =
                        selectPaymentMethods == 'cash' ? '' : 'cash';
                      });
                    },
                    child: Container(
                      width: isLandscape ? 400.w : 345.w,
                      height: isLandscape ? 55.h : 65.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                        border:
                        Border.all(width: 1, color: Colors.grey.shade400),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Padding(
                            padding:  EdgeInsets.all(5.0.w),
                            child: const Icon(
                              Icons.attach_money,
                              color: Color(0xFF00A86B),
                              size: 30,
                            ),
                          ),
            
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 25),
                              child: UiHelper.customText(
                                text: 'Cash',
                                color: Colors.black,
                                fontweight: FontWeight.normal,
                                fontsize: 17,
                              ),
                            ) ,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: isLandscape  ? 160.w : 205.w),
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                Border.all(color: Colors.grey, width: 2),
                              ),
                              child: selectPaymentMethods == 'cash'
                                  ? Center(
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 15),
                        ],
                      ),
                    ),
                  ),
                ),
            
                // Payment Methods - (Wallet)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  child: UiHelper.customText(
                    text: "Wallet",
                    color: Colors.black,
                    fontweight: FontWeight.bold,
                    fontsize: 21,
                  ),
                ),
            
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectPaymentMethods =
                        selectPaymentMethods == 'wallet' ? '' : 'wallet';
                      });
                      //
                    },
                    child: Container(
                        width: isLandscape ? 400.w : 345.w,
                        height: isLandscape ? 55.h : 65.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                        border:
                        Border.all(width: 1, color: Colors.grey.shade400),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(5.0.w),
                            child: const Icon(
                              Icons.account_balance_wallet_rounded,
                              color: Color(0xFF00A86B),

                            ),
                          ),


                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 25),
                            child: UiHelper.customText(
                              text: 'Wallet',
                              color: Colors.black,
                              fontweight: FontWeight.normal,
                              fontsize: 17,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only( left : isLandscape  ? 160.w : 200.w),
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                Border.all(color: Colors.grey, width: 2),
                              ),
                              child: selectPaymentMethods == 'wallet'
                                  ? Center(
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 15),
                        ],
                      ),
                    ),
                  ),
                ),
            
                // Payment Methods - (Cards)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  child: UiHelper.customText(
                    text: "Credit & Debit Card",
                    color: Colors.black,
                    fontweight: FontWeight.bold,
                    fontsize: 21,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.w),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: isLandscape ? 400.w : 345.w,
                      height: isLandscape ? 55.h : 65.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                        border:
                        Border.all(width: 1, color: Colors.grey.shade400),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(5.0.w),
                            child: const Icon(
                              Icons.credit_card,
                              color: Color(0xFF00A86B),

                            ),
                          ),
                          Padding(
                            padding:
                             EdgeInsets.symmetric(horizontal: 25.w),
                            child: UiHelper.customText(
                              text: 'Add Cart',
                              color: Colors.black,
                              fontweight: FontWeight.normal,
                              fontsize: 17,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:  isLandscape ? 130.w : 150.w),
                            child: IconButton(
                              onPressed: () {},
                              icon:
                              const Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
            
                SizedBox(height: 20.h),

                // More Payment Options
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  child: UiHelper.customText(
                    text: "More Payment Options",
                    color: Colors.black,
                    fontweight: FontWeight.bold,
                    fontsize: 21,
                  ),
                ),

                 //Google Pay
                Padding(
                  padding:  EdgeInsets.only(left: isLandscape ? 25.w : 65.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectPaymentMethods = selectPaymentMethods == 'Google Pay'
                            ? ''
                            : 'Google Pay';
                      });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 15),
                        UiHelper.customIconsImage(img: 'google_pay.png'),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 25),
                          child: UiHelper.customText(
                            text: 'Google Pay',
                            color: Colors.black,
                            fontweight: FontWeight.normal,
                            fontsize: 22,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: isLandscape ? 50.w : 29.w),
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(color: Colors.grey, width: 2),
                            ),
                            child: selectPaymentMethods == 'Google Pay'
                                ? Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                            )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),
                  ),
                ),
                // Paypal Pay
                Padding(
                  padding:
                  EdgeInsets.only(left: isLandscape ? 25.w : 65.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectPaymentMethods =
                        selectPaymentMethods == 'Paypal Pay' ? '' : 'Paypal Pay';
                      });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 15),
                        UiHelper.customIconsImage(img: 'paypal_pay.png'),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10,
                          ),
                          child: UiHelper.customText(
                            text: 'Paypal Pay',
                            color: Colors.black,
                            fontweight: FontWeight.normal,
                            fontsize: 22,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: isLandscape ? 55.w : 33.w),
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(color: Colors.grey, width: 2),
                            ),
                            child: selectPaymentMethods == 'Paypal Pay'
                                ? Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                            )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),
                  ),
                ),

                // Apple Pay
                Padding(
                  padding: EdgeInsets.only(left: isLandscape ? 25.w : 65.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectPaymentMethods =
                        selectPaymentMethods == 'Apple Pay' ? '' : 'Apple Pay';
                      });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 15),
                        UiHelper.customIconsImage(img: 'apple_pay.png'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: UiHelper.customText(
                            text: 'Apple Pay',
                            color: Colors.black,
                            fontweight: FontWeight.normal,
                            fontsize: 22,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: isLandscape ? 70.w : 46.w),
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                            child: selectPaymentMethods == 'Apple Pay'
                                ? Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                            )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            
              ],
            ),
          );
        },
      ),
    );
  }
}
