import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mangalelo/models/manga.model.dart';
import 'package:mangalelo/themes/themes.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.manga,
    required this.quantity,
  });

  final Manga manga;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTile(
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(manga.coverImage!),
          ),
          title: Text(
            manga.mangaName!,
            style: Themes.productRowItemName,
          ),
          subtitle: Text(
            '₹ ${(manga.price!).toStringAsFixed(2)} x $quantity',
            style: Themes.productRowItemPrice,
          ),
          trailing: Text(
            '₹ ${(manga.price! * quantity).toStringAsFixed(2)}',
            style: Themes.productRowItemName,
          ),
          ),
    );
  }
}
