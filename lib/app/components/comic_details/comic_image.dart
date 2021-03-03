import 'package:flutter/material.dart';

class ComicImage extends StatelessWidget {
  final String urlImage;
  final String tag;

  ComicImage({this.urlImage, this.tag});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 235,
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.asset('$urlImage'),
      ),
    );
  }
}
