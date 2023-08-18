import 'package:catbreeds_app/data/models/cat.dart';
import 'package:catbreeds_app/presentation/ui/screens/cat_deatils_screen.dart';
import 'package:catbreeds_app/presentation/ui/widgets/cat_attribute.dart';
import 'package:catbreeds_app/presentation/ui/widgets/cat_image.dart';
import 'package:flutter/material.dart';

class CatItem extends StatelessWidget {
  const CatItem({
    super.key,
    required this.cat,
  });
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CatDetailsScreen(cat: cat),
          ),
        );
        FocusScope.of(context).unfocus();
      },
      child: Card(
        margin: const EdgeInsets.all(12),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    cat.name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: IconButton(
                    icon: const Icon(Icons.more_horiz),
                    color: const Color.fromARGB(255, 245, 107, 21),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CatDetailsScreen(cat: cat),
                        ),
                      );
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: CatImage(cat: cat),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cat.origin,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  CatAttribute(
                    attribute: 'Intelligence',
                    description: cat.intelligence.toString(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
