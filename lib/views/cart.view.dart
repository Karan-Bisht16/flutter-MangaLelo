import 'package:flutter/material.dart';
import 'package:mangalelo/models/appState.model.dart';
import 'package:mangalelo/themes/themes.dart';
import 'package:mangalelo/widgets/cartItem.widget.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  String? name;
  String? email;
  String? mobile;
  String? address;
  DateTime? dateTime = DateTime.now();

  final formKey = GlobalKey<FormState>();
  final ExpansionTileController expansionTileController =
      ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
              ExpansionTile(
                title: const Text("User Details"),
                controller: expansionTileController,
                shape: const Border(),
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                          child: buildName(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: buildEmail(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: buildMobile(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: buildAddress(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              if (value.productsInCart.isNotEmpty) ...[
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: value.productsInCart.length,
                    itemBuilder: (context, index) {
                      return CartItem(
                        manga: value.getProductById(
                            value.productsInCart.keys.toList()[index]),
                        quantity: value.productsInCart.values.toList()[index],
                      );
                    },
                    shrinkWrap: true,
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Shipping + Tax',
                        style: Themes.productRowItemPrice,
                      ),
                      Text(
                        '₹ ${value.shippingCost} + ₹ ${value.tax}',
                        style: Themes.productRowItemPrice,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: Themes.productRowItemName,
                      ),
                      Text(
                        '₹ ${value.totalCost.toStringAsFixed(2)}',
                        style: Themes.productRowItemName,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState == null) {
                        if (expansionTileController.isExpanded) {
                          expansionTileController.collapse();
                        } else {
                          expansionTileController.expand();
                        }
                      } else {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          value.clearCart();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Order Placed Successfully'),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text("Place Order"),
                  ),
                ),
              ] else ...[
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.remove_shopping_cart_outlined,
                        size: 80.0,
                      ),
                      Text(
                        "No manga in cart",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ]),
          ),
        );
      },
    );
  }

  Widget buildName() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        prefixIcon: Icon(Icons.person_outline),
      ),
      keyboardType: TextInputType.name,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String? value) {
        name = value;
      },
      onChanged: (value) => setState(() => name = value),
    );
  }

  Widget buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        prefixIcon: Icon(Icons.mail_outline),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email is Required';
        }
        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      onSaved: (String? value) {
        email = value;
      },
      onChanged: (value) => setState(() => email = value),
    );
  }

  Widget buildMobile() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Mobile',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        prefixIcon: Icon(Icons.call_outlined),
      ),
      keyboardType: TextInputType.phone,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Mobile is Required';
        }
        return null;
      },
      onSaved: (String? value) {
        mobile = value;
      },
      onChanged: (value) => setState(() => mobile = value),
    );
  }

  Widget buildAddress() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Address',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        prefixIcon: Icon(Icons.location_on_outlined),
      ),
      keyboardType: TextInputType.streetAddress,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Address is Required';
        }
        return null;
      },
      onSaved: (String? value) {
        address = value;
      },
      onChanged: (value) => setState(() => address = value),
    );
  }
}
