import 'package:flutter/material.dart';
import 'package:souqak/core/theming/styles.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16), // border radius
              child: Image.asset(
                image,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyles.font18WhiteMedium),
                Text(subtitle, style: TextStyles.font14WhiteRegular),
                IconButton(
                  icon: Icon(Icons.add_shopping_cart, color: Colors.white),
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
