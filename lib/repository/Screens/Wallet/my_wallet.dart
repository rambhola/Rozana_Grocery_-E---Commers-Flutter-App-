import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/ui_helper.dart';
import '../Profile/profile_screen.dart';

class MyWallet extends StatefulWidget {
  final String title;
  final String dateTime;
  final String amount;

  const MyWallet({
    super.key,
    required this.title,
    required this.dateTime,
    required this.amount,
  });

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  final List<Map<String, String>> transactions = [
    {
      'title': 'Money Added to Wallet',
      'dateTime': '8 November | 01:00 PM',
      'amount': '₹ 300',
    },
    {
      'title': 'Order Payment',
      'dateTime': '10 November | 05:00 PM',
      'amount': '₹ 450',
    },
    {
      'title': 'Money Added to Wallet',
      'dateTime': '11 November | 10:00 AM',
      'amount': '₹ 670',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(

      builder: (context, constraints) {
        final isLandscape = constraints.maxWidth > constraints.maxHeight;
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
                  onPressed: () {
                    Get.to(() => const ProfileScreen());
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF00A86B),
                    size: 24,
                  ),
                ),
              ),
            ),
            title: const Text(
              "My Wallet",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height:  isLandscape ? 285.h : 172.h,
                  width: isLandscape ? 335.w : 335.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff59b382),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  UiHelper.customText(
                                    text: "Wallet Balance",
                                    color: Colors.black,
                                    fontweight: FontWeight.normal,
                                    fontsize: 22,
                                  ),
                                  UiHelper.customText(
                                    text: "₹1420",
                                    color: Colors.black,
                                    fontweight: FontWeight.normal,
                                    fontsize: 22,
                                  ),
                                ],
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: 70.w, top: 12.h),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.account_balance_wallet,
                                        size: 35,
                                        color: Color(0xff3c8c52),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: isLandscape? 340.w : 300.w,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xff3c8c52),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: const Center(
                                  child: Text(
                                    "Add Money",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transaction['title'] ?? '',
                                  style: const TextStyle(fontSize: 22, ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  transaction['dateTime'] ?? '',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Text(
                              transaction['amount'] ?? '',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },

    );
  }
}
