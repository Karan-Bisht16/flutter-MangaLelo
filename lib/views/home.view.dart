import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:velocity_x/velocity_x.dart';
import "package:mangalelo/models/appState.model.dart";
import "package:mangalelo/views/cart.view.dart";
import "package:mangalelo/views/mangas.view.dart";
import "package:mangalelo/views/search.view.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: model.currentIndex == 0
            ? Text(
                "MangaLelo",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : Text(model.currentIndex == 1 ? "Search Manga" : "My Cart"),
        actions: [
          const VxDarkModeButton(
            showSingleIcon: true,
          ).p12(),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: model.currentIndex,
          children: const [
            Mangas(),
            Search(),
            Cart(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: model.currentIndex,
        onDestinationSelected: (index) {
          model.changeIndex(index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.book), label: "Home"),
          NavigationDestination(icon: Icon(Icons.search), label: "Search"),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: "Cart"),
        ],
      ),
    );
  }
}
