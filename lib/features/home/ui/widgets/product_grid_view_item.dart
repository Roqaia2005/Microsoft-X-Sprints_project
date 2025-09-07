import 'package:flutter/material.dart';
import 'package:souqak/core/theming/styles.dart';

class ProductGridViewItem extends StatelessWidget {
  const ProductGridViewItem({
    super.key,
    required this.title,
    required this.image, this.onPressed,
  });

  final String title;
  final String image;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyles.font18WhiteMedium),
              IconButton(
                icon: Icon(Icons.add_shopping_cart, color: Colors.white),
                onPressed: onPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
