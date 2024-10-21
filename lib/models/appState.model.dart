import 'package:flutter/foundation.dart';
import 'package:mangalelo/models/manga.model.dart';
import 'package:mangalelo/models/product.model.dart';
import 'package:mangalelo/models/productRepo.model.dart';

double salesTaxRate = 0.18;
double shippingCostPerItem = 60;

class AppState extends ChangeNotifier {
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  final productsInCart = <int, int>{};
  Map<int, int> get getProductsInCart {
    return Map.from(productsInCart);
  }

  List<Manga> availableProducts = [];
  List<Product> get getAvailableProducts {
    return List.from(availableProducts);
  }

  List<Manga> getProducts() {
    return availableProducts;
  }

  Manga getProductById(int id) {
    return availableProducts.firstWhere((product) => product.id == id);
  }

  int get totalCartQuantity {
    return productsInCart.values.fold(0, (sum, value) => sum + value);
  }

  double get subtotalCost {
    return productsInCart.keys
        .map((id) => availableProducts[id].price! * productsInCart[id]!)
        .fold(0, (sum, value) => sum + value);
  }

  double get shippingCost {
    return shippingCostPerItem *
        productsInCart.values.fold(0.0, (sum, value) => sum + value);
  }

  double get tax {
    return subtotalCost * salesTaxRate;
  }

  double get totalCost {
    return subtotalCost + shippingCost + tax;
  }

  void addProductToCart(int productId) {
    if (!productsInCart.containsKey(productId)) {
      productsInCart[productId] = 1;
    } else {
      productsInCart[productId] = productsInCart[productId]! + 1;
    }
    notifyListeners();
  }

  void removeItemFromCart(int productId) {
    if (productsInCart.containsKey(productId)) {
      if (productsInCart[productId] == 1) {
        productsInCart.remove(productId);
      } else {
        productsInCart[productId] = productsInCart[productId]! - 1;
      }
    }
    notifyListeners();
  }

  List<Manga> search(String query) {
    return availableProducts
        .where(
          (product) =>
              product.mangaName!.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  void clearCart() {
    productsInCart.clear();
    notifyListeners();
  }

  Future<void> loadProducts() async {
    availableProducts = await ProductRepo.loadAllMangas();
    notifyListeners();
  }

  bool get isLoading => availableProducts.isEmpty;
}
