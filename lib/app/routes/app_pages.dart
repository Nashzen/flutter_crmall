import 'package:get/get.dart';
import 'package:teste_flutter_crmall/modules/comics/comics_page.dart';
import 'package:teste_flutter_crmall/modules/login/login_page.dart';
import 'package:teste_flutter_crmall/modules/menu/menu_bind.dart';
import 'package:teste_flutter_crmall/modules/menu/menu_page.dart';
import 'package:teste_flutter_crmall/modules/splash/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  static var pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
    ),

    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.MENU,
      page: () => MenuPage(),
      binding: MenuBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.HOME,
    //   page: () => HomePage(),
    //   binding: HomeBind(),
    // ),
    GetPage(
      name: AppRoutes.COMICS_PAGE,
      page: () => ComicsPage(),
      // binding: ComicsBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.CHECKOUT,
    //   page: () => CheckoutPage(),
    //   binding: CheckoutBind(),
    // ),
    // GetPage(
    //   name: AppRoutes.PROFILE,
    //   page: () => ProfilePage(),
    //   binding: ProfileBind(),
    // ),
  ];
}
