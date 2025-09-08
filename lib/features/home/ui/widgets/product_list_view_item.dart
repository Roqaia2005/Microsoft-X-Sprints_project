import 'package:flutter/material.dart';
import 'package:souqak/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListViewItem extends StatelessWidget {
  const ProductListViewItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.onPressed,
  });

  final String title;
  final String subtitle;
  final String image;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h), // responsive padding
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              image,
              height: 100.h, // responsive height
              width: 100.w,  // responsive width
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.font18WhiteMedium.copyWith(fontSize: 16.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),
                Text(
                  subtitle,
                  style: TextStyles.font14WhiteRegular.copyWith(fontSize: 12.sp),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.add_shopping_cart, color: Colors.white, size: 22.sp),
                    onPressed: onPressed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
