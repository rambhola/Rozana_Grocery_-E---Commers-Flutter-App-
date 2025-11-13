import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiHelper {
  static customImage({required String img}) {
    return Image.asset("assets/Images/$img");
  }

  static customIconsImage({required String img}) {
    return Image.asset("assets/icon/$img");
  }

  static customText({
    required String text,
    required Color color,
    required FontWeight fontweight,
    String? fontfamily,
    required double fontsize,
    double? textScaleFactor,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLandscape = constraints.maxWidth > constraints.maxHeight;

        // Adjust scale slightly if needed
        double scale = textScaleFactor ?? (isLandscape ? 0.9 : 1.0);

        return Text(
          text,
          textScaleFactor: scale,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: false,
          style: TextStyle(
            fontSize: fontsize.sp,
            fontWeight: fontweight,
            fontFamily: fontfamily ?? "regular",
            color: color,
          ),
        );
      },
    );
  }

  static customTextSearchField({required TextEditingController controller}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLandScape = constraints.maxWidth > constraints.maxHeight;
        return Container(
          height: isLandScape ? 32.h : 37.h,
          width: isLandScape ? constraints.maxWidth * 0.7 : 346.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
            border: Border.all(color: const Color(0xffC5C5C5)),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search “ice-cream”',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/Images/search.png',
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              suffixIcon: Image.asset('assets/Images/mic.png'),
              border: InputBorder.none,
            ),
          ),
        );
      },
    );
  }

  static customButton(voidCallback) {
    return Container(
      width: 35.w,
      height: 22.h,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff27AF34), width: 1.w),
        borderRadius: BorderRadius.circular(4.r),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          "ADD",
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xff27AF34),
          ),
        ),
      ),
    );
  }

  static customUploadFileButton(voidCallback) {
    return Container(
      height: 40.h,
      width: 125.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: const Color(0xff27AF34),
      ),
      child: Center(
        child: Text(
          "Upload Files",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xffffffff),
          ),
        ),
      ),
    );
  }

  static Widget orderCard({
    required String name,
    required String category,
    required String price,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLandscape = constraints.maxWidth > constraints.maxHeight;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Images
              Container(
                height: 120,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  'https://m.media-amazon.com/images/I/91Lj2AJXfOL._SX569_.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 8),

              // Products Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Category
                    Text(
                      category,
                      style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                    ),
                    const SizedBox(height: 4),

                    // Price
                    Text(
                      price,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),

              // Re-Order Button
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 20.w),
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A86B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'Re-order',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
