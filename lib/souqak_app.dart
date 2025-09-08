import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souqak/core/routing/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqak/features/auth/logic/auth_cubit.dart';
import 'package:souqak/features/auth/logic/firebase_service.dart';

class SouqakApp extends StatelessWidget {
  const SouqakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(FirebaseService()),

      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 812),
        child: MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,

          theme: ThemeData.dark(),
          title: "Souqak",
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
