import 'package:flutter/material.dart';

class ComicCardWidget extends StatelessWidget {
  final String comicName;
  final String releaseDate;
  final String price;
  final String imageUrl;
  final Function onTap;

  ComicCardWidget({
    this.comicName,
    this.releaseDate,
    this.price,
    this.imageUrl,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 2.0,
      child: new InkWell(
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
            Positioned.directional(
                textDirection: Directionality.of(context),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    comicName,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
