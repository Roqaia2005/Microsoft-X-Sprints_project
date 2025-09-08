import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

changeLanguage(BuildContext context) {
    if (context.locale == Locale('en', 'US')) {
      context.setLocale(Locale('ar', 'EG'));
    } else if (context.locale == Locale('ar', 'EG')) {
      context.setLocale(Locale('en', 'US'));
    }
  }