import 'package:flutter/material.dart';
import 'package:mangalelo/views/home.view.dart';
import "package:provider/provider.dart";
import 'package:velocity_x/velocity_x.dart';
import "package:mangalelo/models/appState.model.dart";
import 'package:mangalelo/themes/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return VxApp(
      store: MyStore(),
      builder: (context, vxData) => MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          brightness: vxData.isDarkMode ? Brightness.dark : Brightness.light,
          colorScheme:
              vxData.isDarkMode ? Themes.darkScheme : Themes.lightScheme,
        ),
        home: ChangeNotifierProvider<AppState>(
          create: (context) {
            final appState = AppState();
            appState.loadProducts();
            return appState;
          },
          child: const Home(),
        ),
      ),
    );
  }
}

class MyStore extends VxStore {}
