import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mangalelo/models/appState.model.dart';
import 'package:mangalelo/models/manga.model.dart';
import 'package:mangalelo/themes/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Product extends StatelessWidget {
  const Product({
    super.key,
    required this.manga,
  });

  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(manga.coverImage!),
      ),
      title: Text(
        manga.mangaName!,
        style: Themes.productRowItemName,
      ),
      subtitle: Text(
        "₹${manga.price!}",
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          Provider.of<AppState>(context, listen: false)
              .addProductToCart(manga.id!);
          VxToast.show(
            context,
            msg: "Added to cart",
            position: VxToastPosition.center,
            bgColor: Theme.of(context).colorScheme.primary,
            textColor: Theme.of(context).colorScheme.onPrimary,
          );
        },
        icon: Icon(
          Icons.add_circle,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
