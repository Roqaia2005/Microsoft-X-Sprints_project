import 'package:flutter/material.dart';
import 'package:souqak/core/theming/colors.dart';
import 'package:souqak/core/theming/styles.dart';
import 'package:souqak/features/home/data/item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:souqak/features/home/logic/cart_service.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 20),
        backgroundColor: AppColors.blackColor,
        title: Text(tr("cart"), style: TextStyles.font18WhiteMedium),
      ),
      body: StreamBuilder<List<Item>>(
        stream: CartService().getCartItems(), // ✅ رجّع items من Firestore
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(tr("empty"), style: TextStyle(color: Colors.white)),
            );
          }

          final items = snapshot.data!;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                leading: Image.asset(item.image, width: 50, height: 50),
                title: Text(item.title, style: TextStyles.font18WhiteMedium),
                subtitle: item.subtitle != null
                    ? Text(item.subtitle!, style: TextStyles.font14WhiteRegular)
                    : null,
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.white),
                  onPressed: () {
                    CartService().removeItemFromCart(
                      CartService().uid ?? "",
                      item.title,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
