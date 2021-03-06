import 'package:flutter/material.dart';
import 'package:teste_flutter_crmall/app/constants/const_colors.dart';

class ComicCheckoutTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final Function onTap;

  ComicCheckoutTile({this.imageUrl, this.title, this.price, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image(
            image: AssetImage('assets/icons/comics.png'),
            color: marvelRed,
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 18),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            'Price: \$${price}0',
            style: TextStyle(color: Colors.green, fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            onPressed: onTap,
            icon: Icon(Icons.delete),
            color: Colors.red[900],
          ),
        ),
        Divider(
          color: Colors.grey[350],
          endIndent: 16,
          indent: 16,
        ),
      ],
    );
  }
}
