import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/helpers/custom_colors.dart';
import 'modules/login/login_page.dart';
import 'modules/menu/menu_page.dart';
import 'modules/splash/splash_page.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData.light().copyWith(primaryColor: Color(0xffed1d24)),
    // darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.purple[700]),
    // themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    defaultTransition: Transition.native,
    locale: Locale('pt', 'BR'),
    getPages: [
      GetPage(
        name: '/',
        page: () => SplashPage(),
      ),
      GetPage(
        name: '/login',
        page: () => LoginPage(),
      ),
      GetPage(
        name: '/menu',
        page: () => MenuPage(),
      ),
      // GetPage(
      //   name: '/home',
      //   page: () => HomePage(),
      //   binding: HomeBind(),
      // ),
      // GetPage(
      //   name: '/comiclist',
      //   page: () => ComicListPage(),
      //   binding: ComicListBind(),
      // ),
      // GetPage(
      //   name: '/checkout',
      //   page: () => CheckoutPage(),
      //   binding: CheckoutBind(),
      // ),
      // GetPage(
      //   name: '/profile',
      //   page: () => ProfilePage(),
      //   binding: ProfileBind(),
      // ),
    ],
  ));
}
