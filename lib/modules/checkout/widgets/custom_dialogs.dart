// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:teste_flutter_crmall/app/constants/const_colors.dart';

// class CustomDialogs {
//   // NOTE Dialog de evento de compra
//   static Future<bool> buyEvent(BuildContext context) async {
//     Function onTap;
//     var retorno = await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//             child: Padding(
//               padding: EdgeInsets.all(20),
//               child: Container(
//                 height: 300,
//                 child: Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.topCenter,
//                       child: Image(
//                         image: AssetImage('assets/icons/avengers.png'),
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     Text("Enter your card details to pay:",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w600),
//                         textAlign: TextAlign.center),
//                     Column(
//                       children: [
//                         SizedBox(height: 15),
//                         TextField(
//                           keyboardType: TextInputType.number,
//                           inputFormatters: [
//                             MaskTextInputFormatter(
//                                 mask: "#### #### #### ####",
//                                 filter: {"#": RegExp(r'[0-9]')}),
//                           ],
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'Credit card number',
//                           ),
//                         ),
//                         SizedBox(height: 15),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                                 width: 120,
//                                 child: TextField(
//                                   keyboardType: TextInputType.number,
//                                   inputFormatters: [
//                                     MaskTextInputFormatter(
//                                         mask: "##/##",
//                                         filter: {"#": RegExp(r'[0-9]')}),
//                                   ],
//                                   decoration: InputDecoration(
//                                     border: OutlineInputBorder(),
//                                     labelText: 'Expire date',
//                                   ),
//                                 )),
//                             Container(
//                                 width: 120,
//                                 child: TextField(
//                                   keyboardType: TextInputType.number,
//                                   inputFormatters: [
//                                     MaskTextInputFormatter(
//                                         mask: "###",
//                                         filter: {"#": RegExp(r'[0-9]')}),
//                                   ],
//                                   decoration: InputDecoration(
//                                     border: OutlineInputBorder(),
//                                     labelText: 'CVV',
//                                   ),
//                                 )),
//                           ],
//                         ),
//                         SizedBox(height: 15),
//                         FlatButton(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Text('Confirm purchase',
//                               style: TextStyle(fontSize: 18)),
//                           onPressed: () => {
//                             // Get.to(() => ConfirmPurchase()),
//                           },
//                           color: Colors.lightGreen[600],
//                           textColor: Colors.white,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ));
//       },
//     );
//     return (retorno) ?? false;
//   }
// }

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomDialogs extends StatelessWidget {
  final Function onTap;
  final String price;
  CustomDialogs({this.onTap, this.price});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            height: 300,
            child: Column(
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Image(
                        image: AssetImage('assets/icons/avengers.png'),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Total: \$${price}0',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green[700],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text("Enter your card details to pay:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
                Column(
                  children: [
                    SizedBox(height: 15),
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        MaskTextInputFormatter(
                            mask: "#### #### #### ####",
                            filter: {"#": RegExp(r'[0-9]')}),
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Credit card number',
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 120,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                MaskTextInputFormatter(
                                    mask: "##/##",
                                    filter: {"#": RegExp(r'[0-9]')}),
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Expire date',
                              ),
                            )),
                        Container(
                            width: 120,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                MaskTextInputFormatter(
                                    mask: "###",
                                    filter: {"#": RegExp(r'[0-9]')}),
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'CVV',
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: 15),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text('Confirm purchase',
                          style: TextStyle(fontSize: 18)),
                      onPressed: onTap,
                      color: Colors.lightGreen[600],
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
