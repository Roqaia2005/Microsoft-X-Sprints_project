import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:souqak/features/home/data/item.dart';
import 'package:souqak/features/home/logic/cart_service.dart';
import 'package:souqak/features/home/ui/widgets/product_grid_view_item.dart';

class ProductGridview extends StatelessWidget {
  ProductGridview({super.key});

  final List<Item> products = [
    Item(title: "Chair", image: "assets/images/chair.png"),
    Item(title: "Sofa", image: "assets/images/sofa.png"),
    Item(title: "Table", image: "assets/images/table.png"),
    Item(title: "Lamp", image: "assets/images/lamp.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ProductGridViewItem(
            title: products[index].title,
            image: products[index].image,
            onPressed: () async {
              final uid = FirebaseAuth.instance.currentUser!.uid;

              // ✅ أضف المنتج لفايرستور
              await CartService().addItemToCart(products[index]);

              // ✅ عرض رسالة تأكيد
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${products[index].title} added to cart"),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          );
        },
        childCount: products.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 0.8,
      ),
    );
  }
}
