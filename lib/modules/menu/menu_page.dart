import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_flutter_crmall/modules/menu/menu_controller.dart';

class MenuPage extends StatelessWidget {
  /*Todos os controllers sao instanciados por aqui, para serem roteados, e dentro das paginas 
  apenas preciso usar o Get.find() para recuperar as informacoes*/

  MenuController menuController = Get.put(MenuController());

  // final List<Widget> pages = [
  //   HomePage(),
  //   AppointmentsPage(),
  //   PatientsPage(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body:
        // Obx(
        //   () => pages.elementAt(menuController.selectedIndex.value),
        // ),
        bottomNavigationBar: Obx(
      () => BottomNavigationBar(
          currentIndex: menuController.selectedIndex.value,
          onTap: (_index) => menuController.selectedIndex.value = _index,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/avengers.png')),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/comics.png')),
              label: 'Gibis',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/iron-man.png')),
              label: 'Perfil',
            ),
          ]),
    ));
  }
}
