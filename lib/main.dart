import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData.light().copyWith(primaryColor: Color(0xffed1d24)),
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.native,
    locale: Locale('pt', 'BR'),
    getPages: AppPages.pages,
    initialRoute: AppRoutes.SPLASH,
  ));
}
