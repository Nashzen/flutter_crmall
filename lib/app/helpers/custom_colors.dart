import 'package:flutter/material.dart';
import 'package:html_color/html_color.dart';

// NOTE site para pegar os nomes das cores
// http://chir.ag/projects/name-that-color/#AD44BB
enum CustomColor {
  marvelRed,
}

extension ColorLibExtension on CustomColor {
  static const Map<CustomColor, String> names = {
    CustomColor.marvelRed: 'ED1D24',
  };

  String get hex => names[this];

  Color get color => HTMLColor.hex(names[this]);

  Color colorO(double opacity) => HTMLColor.hex(names[this], opcity: opacity);
}

extension ColorExtension on String {
  Color get color => HTMLColor.hex(this, opcity: 1);
}
