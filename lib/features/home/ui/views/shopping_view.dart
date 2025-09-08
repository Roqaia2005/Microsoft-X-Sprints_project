import 'package:flutter/material.dart';
import 'package:souqak/core/theming/colors.dart';
import 'package:souqak/core/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqak/features/home/ui/widgets/product_grid_view.dart';
import 'package:souqak/features/home/ui/widgets/product_list_view.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({super.key});

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 20.sp),
        centerTitle: true,
        backgroundColor: AppColors.blackColor,
        title: Text(
          tr("our-products"),
          style: TextStyles.font24WhiteBold.copyWith(fontSize: 20.sp),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          _SectionTitle(title: tr("featured")),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 180.h,
              child: PageView(
                controller: PageController(viewportFraction: 0.85),
                children: const [
                  _FeaturedImage("assets/images/vase.png"),
                  _FeaturedImage("assets/images/sofa.png"),
                  _FeaturedImage("assets/images/lamp.png"),
                ],
              ),
            ),
          ),

          // 🔹 Product Grid
          ProductGridview(),

          // 🔹 Hot Offers Title
          _SectionTitle(title: tr("hot")),

          // 🔹 Hot Offers List
          ProductListView(),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: Text(
          title,
          style: TextStyles.font18WhiteBold.copyWith(fontSize: 18.sp),
        ),
      ),
    );
  }
}

class _FeaturedImage extends StatelessWidget {
  final String path;
  const _FeaturedImage(this.path);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }
}
