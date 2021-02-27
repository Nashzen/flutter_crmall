import 'package:get/get.dart';

class MenuController extends GetxController {
  var selectedIndex = 0.obs;

  void changePage(_index) {
    this.selectedIndex = _index;
  }
}
