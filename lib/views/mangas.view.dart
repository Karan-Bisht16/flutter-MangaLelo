import 'package:flutter/material.dart';
import 'package:mangalelo/widgets/mangaContainer.widget.dart';
import 'package:provider/provider.dart';
import 'package:mangalelo/models/appState.model.dart';

class Mangas extends StatelessWidget {
  const Mangas({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, value, child) {
      if (value.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      final products = value.getProducts();
      // return products;
      return MangaContainer(mangas: products);
      // return ListView.builder(
      //   itemCount: products.length,
      //   itemBuilder: (context, index) {
      //     return Product(manga: products[index]);
      //   },
      // );
    });
  }
}
