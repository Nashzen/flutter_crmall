import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_flutter_crmall/app/constants/const_colors.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData.light().copyWith(primaryColor: marvelRed),
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.native,
    locale: Locale('pt', 'BR'),
    getPages: AppPages.pages,
    initialRoute: AppRoutes.SPLASH,
  ));
}
