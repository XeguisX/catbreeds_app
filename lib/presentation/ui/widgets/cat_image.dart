import 'package:catbreeds_app/data/data_source/http.dart';
import 'package:catbreeds_app/data/models/cat.dart';
import 'package:flutter/material.dart';

class CatImage extends StatelessWidget {
  const CatImage({super.key, required this.cat});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    const imgUrlDefault =
        'https://st4.depositphotos.com/2617731/22060/v/450/depositphotos_220604246-stock-illustration-vector-cat-logo-on-a.jpg';

    String getUrl(String ext) =>
        'https://cdn2.thecatapi.com/images/${cat.referenceImageId}.$ext';

    Future<String> getImage() async {
      if (cat.referenceImageId == null) return imgUrlDefault;
      if (await existsUrl(getUrl('jpg'))) return getUrl('jpg');
      if (await existsUrl(getUrl('png'))) return getUrl('png');
      return imgUrlDefault;
    }

    return FutureBuilder(
      future: getImage(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return FadeInImage(
            placeholder: const AssetImage('assets/gif/loading.gif'),
            image: NetworkImage(snapshot.data!),
            fit: BoxFit.cover,
          );
        }
        return Image.asset(
          'assets/gif/loading.gif',
          fit: BoxFit.cover,
        );
      },
    );
  }
}
