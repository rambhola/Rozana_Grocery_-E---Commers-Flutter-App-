import 'package:rozana_grocery_app/repository/widgets/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../widgets/ui_helper.dart';
import '../Profile/profile_screen.dart';
import 'ticket_clipper.dart';

class MyCoupons extends StatefulWidget {
  const MyCoupons({super.key});

  @override
  State<MyCoupons> createState() => _MyCouponsState();
}

class _MyCouponsState extends State<MyCoupons> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
              "Coupons",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 23),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiHelper.customText(
                    text: "Best Offers for you",
                    color: Colors.black,
                    fontweight: FontWeight.bold,
                    fontsize: 22,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: CustomPaint(
                      painter: TicketBorderPainter(),
                      child: ClipPath(
                        clipper: TicketClipper(),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UiHelper.customText(
                                text: 'DG0JH24',
                                color: Colors.black,
                                fontweight: FontWeight.bold,
                                fontsize: 18,
                              ),
                              UiHelper.customText(
                                text: 'Add item worth 500 more to unlock',
                                color: Colors.black,
                                fontweight: FontWeight.normal,
                                fontsize: 17,
                              ),

                              UiHelper.customText(
                                text: 'Get 50% OFF',
                                color: Colors.black,
                                fontweight: FontWeight.bold,
                                fontsize: 16,
                              ),
                              SizedBox(height: 10,),
                              TextButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    const ClipboardData(text: 'DG0JH24'),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Coupon code copied!'),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 24),
                                  foregroundColor: const Color(0xFF00A86B),
                                  backgroundColor: Colors.grey.shade300,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "COPY CODE",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: CustomPaint(
                      painter: TicketBorderPainter(),
                      child: ClipPath(
                        clipper: TicketClipper(),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UiHelper.customText(
                                text: 'DG0JH24',
                                color: Colors.black,
                                fontweight: FontWeight.bold,
                                fontsize: 18,
                              ),
                              UiHelper.customText(
                                text: 'Add item worth 500 more to unlock',
                                color: Colors.black,
                                fontweight: FontWeight.normal,
                                fontsize: 17,
                              ),

                              UiHelper.customText(
                                text: 'Get 50% OFF',
                                color: Colors.black,
                                fontweight: FontWeight.bold,
                                fontsize: 16,
                              ),
                              SizedBox(height: 10,),
                              TextButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    const ClipboardData(text: 'DG0JH24'),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Coupon code copied!'),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 24),
                                  foregroundColor: const Color(0xFF00A86B),
                                  backgroundColor: Colors.grey.shade300,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "COPY CODE",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(height: 20),
                  Center(
                    child: CustomPaint(
                      painter: TicketBorderPainter(),
                      child: ClipPath(
                        clipper: TicketClipper(),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UiHelper.customText(
                                text: 'DG0JH24',
                                color: Colors.black,
                                fontweight: FontWeight.bold,
                                fontsize: 18,
                              ),
                              UiHelper.customText(
                                text: 'Add item worth 500 more to unlock',
                                color: Colors.black,
                                fontweight: FontWeight.normal,
                                fontsize: 17,
                              ),

                              UiHelper.customText(
                                text: 'Get 50% OFF',
                                color: Colors.black,
                                fontweight: FontWeight.bold,
                                fontsize: 16,
                              ),
                              SizedBox(height: 10,),
                              TextButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    const ClipboardData(text: 'DG0JH24'),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Coupon code copied!'),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 24),
                                  foregroundColor: const Color(0xFF00A86B),
                                  backgroundColor: Colors.grey.shade300,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "COPY CODE",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: CustomPaint(
                      painter: TicketBorderPainter(),
                      child: ClipPath(
                        clipper: TicketClipper(),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UiHelper.customText(
                                text: 'DG0JH24',
                                color: Colors.black,
                                fontweight: FontWeight.bold,
                                fontsize: 18,
                              ),
                              UiHelper.customText(
                                text: 'Add item worth 500 more to unlock',
                                color: Colors.black,
                                fontweight: FontWeight.normal,
                                fontsize: 17,
                              ),

                              UiHelper.customText(
                                text: 'Get 50% OFF',
                                color: Colors.black,
                                fontweight: FontWeight.bold,
                                fontsize: 16,
                              ),
                              SizedBox(height: 10,),
                              TextButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    const ClipboardData(text: 'DG0JH24'),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Coupon code copied!'),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 24),
                                  foregroundColor: const Color(0xFF00A86B),
                                  backgroundColor: Colors.grey.shade300,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "COPY CODE",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
