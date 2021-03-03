import 'package:flutter/material.dart';
import 'package:teste_flutter_crmall/app/constants/const_colors.dart';

class ComicDescription extends StatelessWidget {
  const ComicDescription(
      {Key key,
      this.pressOnSeeMore,
      this.urlImage,
      this.description,
      this.title})
      : super(key: key);

  final GestureTapCallback pressOnSeeMore;
  final String urlImage;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: (20)),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(15),
            width: (60),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: (20),
            right: (64),
          ),
          child: Text(
            description,
            maxLines: 6,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: (20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  "See More Detail",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: lightInput),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: lightInput,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
