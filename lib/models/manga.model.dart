import 'package:mangalelo/models/product.model.dart';

class Mangas {
  List<Manga>? mangas;

  Mangas({this.mangas});

  Mangas.fromJson(Map<String, dynamic> json) {
    if (json['mangas'] != null) {
      mangas = <Manga>[];
      json['mangas'].forEach((v) {
        mangas!.add(Manga.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mangas != null) {
      data['mangas'] = mangas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Manga extends Product {
  int? id;
  String? category;
  int? price;
  String? mangaName;
  String? description;
  String? coverImage;
  List<Reviews>? reviews;
  String? reviewerName;

  Manga({
    this.id,
    this.category,
    this.price,
    this.mangaName,
    this.description,
    this.coverImage,
    this.reviews,
    this.reviewerName,
  });

  Manga.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    price = json['price'];
    mangaName = json['mangaName'];
    description = json['description'];
    coverImage = json['coverImage'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    reviewerName = json['reviewerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['price'] = price;
    data['mangaName'] = mangaName;
    data['description'] = description;
    data['coverImage'] = coverImage;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['reviewerName'] = reviewerName;
    return data;
  }

  @override
  String toString() {
    return "Name: $mangaName, Price: $price Rs.";
  }
}

class Reviews {
  String? reviewerName;
  String? review;
  String? rating;

  Reviews({this.reviewerName, this.review, this.rating});

  Reviews.fromJson(Map<String, dynamic> json) {
    reviewerName = json['reviewerName'];
    review = json['review'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reviewerName'] = reviewerName;
    data['review'] = review;
    data['rating'] = rating;
    return data;
  }
}
