import 'package:flutter/material.dart';
import 'package:souqak/features/home/data/item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:souqak/features/home/logic/cart_service.dart';
import 'package:souqak/features/home/ui/widgets/product_grid_view_item.dart';

class ProductGridview extends StatelessWidget {
  ProductGridview({super.key});

  final List<Item> products = [
    Item(title: tr("chair"), image: "assets/images/chair.png"),
    Item(title: tr("sofa"), image: "assets/images/sofa.png"),
    Item(title: tr("table"), image: "assets/images/table.png"),
    Item(title: tr("lamp"), image: "assets/images/lamp.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return ProductGridViewItem(
          title: products[index].title,
          image: products[index].image,
          onPressed: () async {
            await CartService().addItemToCart(products[index]);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(tr("added-to-cart")),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        );
      }, childCount: products.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 0.8,
      ),
    );
  }
}
