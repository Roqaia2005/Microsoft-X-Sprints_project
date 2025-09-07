import 'package:flutter/material.dart';
import 'package:souqak/core/theming/colors.dart';
import 'package:souqak/core/theming/styles.dart';
import 'package:souqak/features/home/ui/widgets/product_grid_view.dart';
import 'package:souqak/features/home/ui/widgets/product_list_view.dart';

class ShoppingView extends StatelessWidget {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 20),
        centerTitle: true,
        backgroundColor: AppColors.blackColor,

        title: Text("Our Products", style: TextStyles.font24WhiteBold),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Our Products", style: TextStyles.font24WhiteBold),
            ),
          ),

          // Grid
          ProductGridview(),

          // Title
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text("Hot offers", style: TextStyles.font24WhiteBold),
            ),
          ),

          // List
          ProductListView(),
        ],
      ),
    );
  }
}
