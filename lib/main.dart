import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mangalelo/app/app.dart';

void main() {
  runApp(const App());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

