import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mangalelo/models/manga.model.dart';

class ProductRepo {
  static Future<List<Manga>> loadAllMangas() async {
    final response = await rootBundle.loadString("assets/manga.json");
    final mangaData = Mangas.fromJson(jsonDecode(response));
    return mangaData.mangas!;
  }
}
