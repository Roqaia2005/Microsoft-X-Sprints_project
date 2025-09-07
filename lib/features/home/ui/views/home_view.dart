import 'package:flutter/material.dart';
import 'package:souqak/core/theming/colors.dart';
import 'package:souqak/features/home/ui/views/cart_view.dart';
import 'package:souqak/features/home/ui/views/shopping_view.dart';
import 'package:souqak/features/home/ui/widgets/app_nav_bar.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> screens = [
    ShoppingView(),
    CartView(),
  
  ];
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: screens[currentPageIndex],
      bottomNavigationBar: AppNavBar(
        currentPageIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
