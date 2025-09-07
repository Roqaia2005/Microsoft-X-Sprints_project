import 'product_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:souqak/features/home/data/item.dart';
import 'package:souqak/features/home/logic/cart_service.dart';

class ProductListView extends StatelessWidget {
  ProductListView({super.key});

  final List<Item> hotOffers = [
    Item(
      title: "Minimalist Vase",
      subtitle: "20% off on all ceramic items",
      image: "assets/images/vase.png",
    ),
    Item(
      title: "Abstract Art",
      subtitle: "Buy one get one free",
      image: "assets/images/art.png",
    ),
    Item(
      title: "Cozy Blanket",
      subtitle: "Free shipping on orders over \$50",
      image: "assets/images/blanket.png",
    ),
    Item(
      title: "Scented Candle",
      subtitle: "Bundle and save up to 30%",
      image: "assets/images/candle.png",
    ),
    Item(
      title: "Wall Clock",
      subtitle: "Limited time offer: 15% off",
      image: "assets/images/clock.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return ProductListViewItem(
          title: hotOffers[index].title,
          subtitle: hotOffers[index].subtitle ?? "",
          image: hotOffers[index].image,
          onPressed: () async {
            final uid = FirebaseAuth.instance.currentUser!.uid;

            // ✅ استدعاء CartService لإضافة المنتج
            await CartService().addItemToCart(hotOffers[index]);

            // ✅ عرض SnackBar للتأكيد
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${hotOffers[index].title} added to cart"),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        );
      }, childCount: hotOffers.length),
    );
  }
}
