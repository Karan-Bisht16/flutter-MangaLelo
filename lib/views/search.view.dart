import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mangalelo/models/appState.model.dart';
import 'package:mangalelo/widgets/customSearchBar.widget.dart';
import 'package:mangalelo/widgets/product.widget.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late final TextEditingController textEditingController;
  late final FocusNode focusNode;

  String query = "";

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: query)
      ..addListener(onQueryChanged);
    focusNode = FocusNode();
  }

  void onQueryChanged() {
    setState(() {
      query = textEditingController.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppState>(context);
    final filteredProducts = model.search(query);
    return SafeArea(
      child: Column(
        children: [
          buildSearchBox(context),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return Product(manga: filteredProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchBox(BuildContext context) {
    return CustomSearchBar(
      controller: textEditingController,
      focusNode: focusNode,
    );
  }
}
