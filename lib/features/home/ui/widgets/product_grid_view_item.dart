import 'package:flutter/material.dart';
import 'package:souqak/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductGridViewItem extends StatelessWidget {
  const ProductGridViewItem({
    super.key,
    required this.title,
    required this.image,
    this.onPressed,
  });

  final String title;
  final String image;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w), // responsive padding
      child: Container(
        padding: EdgeInsets.all(16.w), // responsive container padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), // responsive radius
          color: Colors.transparent, // optional background
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image container
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 120.h, // responsive height
                width: double.infinity,
              ),
            ),
            SizedBox(height: 12.h),

            // Title + cart button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyles.font18WhiteMedium.copyWith(
                      fontSize: 16.sp, // responsive font
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                    size: 22.sp,
                  ),
                  onPressed: onPressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
