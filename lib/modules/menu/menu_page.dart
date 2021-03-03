import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_flutter_crmall/app/constants/const_colors.dart';
import 'package:teste_flutter_crmall/modules/checkout/checkout_page.dart';
import 'package:teste_flutter_crmall/modules/comics/comics_controller.dart';
import 'package:teste_flutter_crmall/modules/comics/comics_page.dart';
import 'package:teste_flutter_crmall/modules/login/login_page.dart';
import 'package:teste_flutter_crmall/modules/profile/profile_page.dart';
import 'package:teste_flutter_crmall/repositories/comic_repository.dart';

import 'menu_controller.dart';

class MenuPage extends StatelessWidget {
  /*Todos os controllers sao instanciados por aqui, para serem roteados, e dentro das paginas 
  apenas preciso usar o Get.find() para recuperar as informacoes*/

  final MenuController menuController = Get.put(MenuController());
  final ComicsController comicsController =
      Get.put(ComicsController(repository: ComicRepository()));

  final List<Widget> pages = [
    ComicsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: ImageIcon(AssetImage('assets/icons/exit.png')),
              onPressed: () {
                Get.offAll(LoginPage());
              },
            )
          ],
        ),
        body: Obx(
          () => pages.elementAt(menuController.selectedIndex.value),
        ),
        floatingActionButton: Obx(() => FloatingActionButton(
              heroTag: 'menubtn',
              child: comicsController.comicsOnCartList.length > 0
                  ? ImageIcon(AssetImage('assets/icons/shop-cart-filled.png'))
                  : ImageIcon(AssetImage('assets/icons/shop-cart.png')),
              backgroundColor: marvelRed,
              onPressed: () {
                Get.to(() => CheckoutPage());
              },
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              currentIndex: menuController.selectedIndex.value,
              onTap: (_index) => menuController.selectedIndex.value = _index,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/comics.png')),
                  label: 'Comics',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/iron-man.png')),
                  label: 'Options',
                ),
              ]),
        ));
  }
}
