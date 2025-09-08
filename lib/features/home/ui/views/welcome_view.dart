import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:souqak/core/theming/colors.dart';
import 'package:souqak/core/theming/styles.dart';
import 'package:souqak/core/routing/app_router.dart';
import 'package:souqak/core/helpers/change_lang.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqak/features/home/ui/widgets/custom_button.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondaryColor,
        onPressed: () => changeLanguage(context),
        child: const Icon(Icons.language, color: Colors.white),
      ),
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          tr("app_name"),
          style: TextStyles.font24WhiteBold.copyWith(fontSize: 22.sp),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _WelcomeImage("assets/images/welcome1.png"),
                  SizedBox(width: 16.w),
                  _WelcomeImage("assets/images/welcome2.png"),
                ],
              ),

              SizedBox(height: 24.h),

              Text(
                tr("welcome_message"),
                textAlign: TextAlign.center,
                style: TextStyles.font18WhiteMedium.copyWith(fontSize: 16.sp),
              ),

              SizedBox(height: 24.h),

              _ActionButton(
                text: tr("signup"),
                color: AppColors.buttonColor,
                onPressed: () => context.push(AppRouter.kSignupView),
              ),
              SizedBox(height: 12.h),
              _ActionButton(
                text: tr("signin"),
                color: AppColors.secondaryColor,
                onPressed: () => context.push(AppRouter.kLoginView),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeImage extends StatelessWidget {
  final String path;
  const _WelcomeImage(this.path);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Image.asset(path, width: 140.w, height: 140.w, fit: BoxFit.cover),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CustomButton(
        text: text,
        backgroundColor: color,
        onPressed: onPressed,
      ),
    );
  }
}
