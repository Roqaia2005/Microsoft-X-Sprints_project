import 'product_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:souqak/features/home/data/item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:souqak/features/home/logic/cart_service.dart';

class ProductListView extends StatelessWidget {
  ProductListView({super.key});

  final List<Item> hotOffers = [
    Item(
      title: tr("vase_title"),
      subtitle: tr("vase_subtitle"),
      image: "assets/images/vase.png",
    ),
    Item(
      title: tr("art_title"),
      subtitle: tr("art_subtitle"),
      image: "assets/images/art.png",
    ),
    Item(
      title: tr("blanket_title"),
      subtitle: tr("blanket_subtitle"),
      image: "assets/images/blanket.png",
    ),
    Item(
      title: tr("candle_title"),
      subtitle: tr("candle_subtitle"),
      image: "assets/images/candle.png",
    ),
    Item(
      title: tr("clock_title"),
      subtitle: tr("clock_subtitle"),
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

            await CartService().addItemToCart(hotOffers[index]);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(tr("added-to-car")),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        );
      }, childCount: hotOffers.length),
    );
  }
}
