import 'package:flutter/material.dart';
import 'package:souqak/core/theming/colors.dart';
import 'package:souqak/core/theming/styles.dart';

class AppNavBar extends StatelessWidget {
  final int currentPageIndex;
  final ValueChanged<int> onDestinationSelected;

  const AppNavBar({
    super.key,
    required this.currentPageIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentPageIndex,
      backgroundColor: AppColors.secondaryColor,
      indicatorColor: Colors.transparent,
      onDestinationSelected: onDestinationSelected,
      destinations: [
        NavigationDestination(
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.home, color: Colors.white),
              Text("Home", style: TextStyles.font14WhiteRegular),
            ],
          ),
          label: '',
        ),
        NavigationDestination(
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.shopping_cart, color: Colors.white),
              Text("Cart", style: TextStyles.font14WhiteRegular),
            ],
          ),
          label: '',
        ),
      ],
    );
  }
}
