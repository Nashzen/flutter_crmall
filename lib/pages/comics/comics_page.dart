// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'comics_controller.dart';

// class ComicListPage extends GetView<ComicsController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(controller.comics.length.toString())),
//       body: Container(
//         child: GetX<ComicsController>(initState: (state) {
//           Get.find<ComicsController>().getComics();
//         }, builder: (controller) {
//           return controller.comics.length < 1
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : ListView.builder(
//                   itemCount: controller.comics.length,
//                   itemBuilder: (context, i) {
//                     return ListTile(
//                       title: Text('${controller.comics[i].comics[i].title}'),
//                     );
//                   },
//                 );
//         }),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'comics_controller.dart';

class ComicsPage extends GetView<ComicsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${controller.comics.length}')),
      body: Container(
        child: GetX<ComicsController>(initState: (state) {
          Get.find<ComicsController>().getComics();
        }, builder: (_) {
          return Container();
        }),
      ),
    );
  }
}
