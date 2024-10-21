import 'package:flutter/material.dart';
import 'package:mangalelo/models/appState.model.dart';
import 'package:mangalelo/models/manga.model.dart';
import 'package:velocity_x/velocity_x.dart';

class Detail extends StatelessWidget {
  const Detail({
    super.key,
    required this.manga,
    required this.model,
  });

  final Manga manga;
  final AppState model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: Text(
          manga.mangaName!,
        ),
        iconTheme: const IconThemeData(),
      ),
      body: DetailBody(manga: manga, model: model),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({
    super.key,
    required this.manga,
    required this.model,
  });

  final Manga manga;
  final AppState model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2,
                    child: Image.network(
                      manga.coverImage!,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                model.addProductToCart(manga.id!);
                VxToast.show(
                  context,
                  msg: "Added to cart",
                  position: VxToastPosition.center,
                  bgColor: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                );
              },
              child: const Text("Add to Cart"),
            ),
            const DetailBodyTitle(title: "A brief synopsis:"),
            DetailBodyContent(content: manga.description!),
            const DetailBodyTitle(title: "My thoughts & review: "),
            const SizedBox(height: 8.0),
            RichText(
              text: const TextSpan(
                text: "My rating: ",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const DetailBodyTitle(title: "My favourite characters:"),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: manga.reviews!.length,
              itemBuilder: (BuildContext context, int index) {
                final characters = manga.reviews;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 18,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width - 110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              characters![index].reviewerName!,
                            ),
                            Text(
                              characters[index].review!,
                            ),
                            Text(
                              characters[index].rating!,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DetailBodyTitle extends StatelessWidget {
  const DetailBodyTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class DetailBodyContent extends StatelessWidget {
  const DetailBodyContent({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(),
    );
  }
}
