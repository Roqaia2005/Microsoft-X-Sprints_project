import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:souqak/core/theming/colors.dart';
import 'package:souqak/core/theming/styles.dart';
import 'package:souqak/core/routing/app_router.dart';
import 'package:souqak/features/home/ui/widgets/custom_button.dart';


class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('ShopSmart', style: TextStyles.font24WhiteBold),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "assets/images/welcome1.png",
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(width: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "assets/images/welcome2.png",
                      width: 200,
                      height: 200,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  textAlign: TextAlign.center,
                  style: TextStyles.font18WhiteMedium,
                  " Discover a world of endless possibilities with ShopSmart. Your one-stop destination for all your shopping needs.",
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  text: "Sign-up",
                  backgroundColor: AppColors.buttonColor,
                  onPressed: () {
                    context.push(AppRouter.kSignupView);
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  text: "Sign-in",
                  backgroundColor: AppColors.secondaryColor,
                  onPressed: () {
                    context.push(AppRouter.kLoginView);
                  },
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
